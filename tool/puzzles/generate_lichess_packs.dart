import 'dart:convert';
import 'dart:io';

import 'package:schach_app/core/content/content_manifest.dart';
import 'package:schach_app/core/content/puzzle_generation.dart';
import 'package:schach_app/core/models/puzzle.dart';

const String _defaultInputZst = 'lichess_db_puzzle.csv.zst';
const String _defaultThemeXml = 'puzzle_theme.xml';
const String _defaultManifestPath = 'assets/content/manifest.json';
const String _defaultOutputDir = 'assets/content/puzzles/generated';

const int _packSize = 200;
const int _mixPoolSize = 2500;
const int _manifestVersion = 2;

Future<void> main(List<String> args) async {
  final options = _parseArgs(args);
  if (options.showHelp) {
    _printUsage();
    return;
  }

  final inputZst = options.inputZst ?? _defaultInputZst;
  final themeXmlPath = options.themeXml ?? _defaultThemeXml;
  final manifestPath = options.manifestPath ?? _defaultManifestPath;
  final outputDirPath = options.outputDir ?? _defaultOutputDir;

  final xml = await File(themeXmlPath).readAsString();
  final themeDescriptions = parseThemeDescriptions(xml);
  final themeLabels = parseThemeLabels(xml);

  final bucketKeepers = <String, TopCandidateKeeper>{};
  for (final theme in kSupportedPuzzleThemes) {
    for (final band in const <String>['600_999', '1000_1399', '1400_1799']) {
      bucketKeepers['$theme|$band'] = TopCandidateKeeper(_packSize);
    }
  }
  final mixKeeper = TopCandidateKeeper(_mixPoolSize);

  var totalRows = 0;
  var acceptedRows = 0;
  var filteredRows = 0;
  var invalidRows = 0;

  final process = await Process.start('zstd', <String>['-dc', inputZst]);
  final lineStream = process.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter());

  var isHeader = true;
  await for (final line in lineStream) {
    if (isHeader) {
      isHeader = false;
      continue;
    }
    totalRows += 1;

    final row = LichessPuzzleRow.fromCsvLine(line);
    if (row == null) {
      invalidRows += 1;
      continue;
    }

    if (!_passesQualityFilters(row)) {
      filteredRows += 1;
      continue;
    }

    final candidate = buildCandidate(row, themeDescriptions: themeDescriptions);
    if (candidate == null) {
      invalidRows += 1;
      continue;
    }

    final keeper = bucketKeepers['${candidate.theme}|${candidate.band}'];
    if (keeper == null) {
      filteredRows += 1;
      continue;
    }

    keeper.add(candidate);
    if (candidate.band == '600_999') {
      mixKeeper.add(candidate);
    }
    acceptedRows += 1;
  }

  final stderrText = await process.stderr.transform(utf8.decoder).join();
  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    throw ProcessException(
      'zstd',
      <String>['-dc', inputZst],
      'Failed to read input file. $stderrText',
      exitCode,
    );
  }

  final selectedByPack = <String, List<GeneratedPuzzleCandidate>>{};
  final usedPuzzleIds = <String>{};
  final generatedPackDescriptors = <GeneratedPuzzlePackDescriptor>[];

  for (final theme in kSupportedPuzzleThemes) {
    for (final band in const <String>['600_999', '1000_1399', '1400_1799']) {
      final key = '$theme|$band';
      final packId = 'gen_${theme}_$band';
      final best = (bucketKeepers[key]?.bestDescending() ?? const [])
          .take(_packSize)
          .toList(growable: false);

      selectedByPack[packId] = best;
      for (final candidate in best) {
        usedPuzzleIds.add(candidate.id);
      }

      final difficulty = _difficultyForBand(band);
      final label = themeLabels[theme] ?? theme;
      final title = '$label · ${_levelLabel(difficulty)}';
      generatedPackDescriptors.add(
        GeneratedPuzzlePackDescriptor(
          id: packId,
          file: 'puzzles/generated/$packId.json',
          title: title,
          description: 'Theme training: $label (${_ratingLabel(band)}).',
          category: 'theme_training',
          difficulty: difficulty,
          tags: <String>[theme, band],
          puzzles: best.map((candidate) => candidate.puzzle).toList(),
        ),
      );
    }
  }

  final mixBest = mixKeeper.bestDescending();
  final uniqueMix = mixBest
      .where((candidate) => !usedPuzzleIds.contains(candidate.id))
      .take(_packSize)
      .toList(growable: true);
  if (uniqueMix.length < _packSize) {
    for (final candidate in mixBest) {
      if (uniqueMix.length >= _packSize) {
        break;
      }
      if (!uniqueMix.any((item) => item.id == candidate.id)) {
        uniqueMix.add(candidate);
      }
    }
  }

  final mixId = 'gen_starter_mix_600_999';
  generatedPackDescriptors.add(
    GeneratedPuzzlePackDescriptor(
      id: mixId,
      file: 'puzzles/generated/$mixId.json',
      title: 'Starter Mix · Beginner',
      description: 'Beginner-friendly mix across tactical themes.',
      category: 'theme_training',
      difficulty: 1,
      tags: const <String>['mix', '600_999'],
      puzzles: uniqueMix.map((candidate) => candidate.puzzle).toList(),
    ),
  );

  final outputDir = Directory(outputDirPath);
  await outputDir.create(recursive: true);
  await for (final entity in outputDir.list()) {
    if (entity is File && entity.path.endsWith('.json')) {
      await entity.delete();
    }
  }

  for (final pack in generatedPackDescriptors) {
    final packJson = PuzzlePack(
      packId: pack.id,
      title: pack.title,
      description: pack.description,
      category: pack.category,
      tags: pack.tags,
      difficulty: pack.difficulty,
      puzzles: pack.puzzles,
    );
    await File('${outputDir.path}/${pack.id}.json').writeAsString(
      const JsonEncoder.withIndent('  ').convert(packJson.toJson()),
    );
  }

  final manifestFile = File(manifestPath);
  final manifestRaw = await manifestFile.readAsString();
  final manifest = ContentManifest.fromJson(
    jsonDecode(manifestRaw) as Map<String, dynamic>,
  );

  final newEntries = generatedPackDescriptors
      .map(
        (pack) => ContentIndexEntry(
          id: pack.id,
          file: pack.file,
          version: _manifestVersion,
          count: pack.puzzles.length,
          title: pack.title,
          category: pack.category,
          difficulty: pack.difficulty,
          tags: pack.tags,
        ),
      )
      .toList(growable: false);

  final updatedManifest = manifest.copyWith(
    version: '2.0.0',
    puzzlePacks: newEntries,
  );
  await manifestFile.writeAsString(
    const JsonEncoder.withIndent('  ').convert(updatedManifest.toJson()),
  );

  stdout.writeln('Rows scanned: $totalRows');
  stdout.writeln('Rows accepted: $acceptedRows');
  stdout.writeln('Rows filtered: $filteredRows');
  stdout.writeln('Rows invalid: $invalidRows');
  for (final pack in generatedPackDescriptors) {
    stdout.writeln('Generated ${pack.id}: ${pack.puzzles.length} puzzles');
  }
}

bool _passesQualityFilters(LichessPuzzleRow row) {
  if (row.rating < 600 || row.rating > 1799) {
    return false;
  }
  if (row.ratingDeviation > 95) {
    return false;
  }
  if (row.popularity < 75) {
    return false;
  }
  if (row.nbPlays < 100) {
    return false;
  }
  if (row.moves.length > 12) {
    return false;
  }
  return true;
}

int _difficultyForBand(String band) {
  switch (band) {
    case '600_999':
      return 1;
    case '1000_1399':
      return 2;
    case '1400_1799':
      return 3;
    default:
      return 1;
  }
}

String _levelLabel(int difficulty) {
  switch (difficulty) {
    case 1:
      return 'Beginner';
    case 2:
      return 'Intermediate';
    case 3:
      return 'Advanced';
    default:
      return 'Beginner';
  }
}

String _ratingLabel(String band) {
  switch (band) {
    case '600_999':
      return '600-999';
    case '1000_1399':
      return '1000-1399';
    case '1400_1799':
      return '1400-1799';
    default:
      return band;
  }
}

_Args _parseArgs(List<String> args) {
  String? inputZst;
  String? themeXml;
  String? outputDir;
  String? manifestPath;
  var showHelp = false;

  for (final arg in args) {
    if (arg == '--help' || arg == '-h') {
      showHelp = true;
    } else if (arg.startsWith('--input-zst=')) {
      inputZst = arg.substring('--input-zst='.length);
    } else if (arg.startsWith('--themes-xml=')) {
      themeXml = arg.substring('--themes-xml='.length);
    } else if (arg.startsWith('--out-dir=')) {
      outputDir = arg.substring('--out-dir='.length);
    } else if (arg.startsWith('--manifest=')) {
      manifestPath = arg.substring('--manifest='.length);
    }
  }

  return _Args(
    inputZst: inputZst,
    themeXml: themeXml,
    outputDir: outputDir,
    manifestPath: manifestPath,
    showHelp: showHelp,
  );
}

void _printUsage() {
  stdout.writeln('Generate curated puzzle packs from Lichess CSV .zst');
  stdout.writeln('Usage:');
  stdout.writeln(
    '  dart run tool/puzzles/generate_lichess_packs.dart '
    '[--input-zst=path] [--themes-xml=path] [--out-dir=dir] [--manifest=path]',
  );
}

class _Args {
  _Args({
    required this.inputZst,
    required this.themeXml,
    required this.outputDir,
    required this.manifestPath,
    required this.showHelp,
  });

  final String? inputZst;
  final String? themeXml;
  final String? outputDir;
  final String? manifestPath;
  final bool showHelp;
}
