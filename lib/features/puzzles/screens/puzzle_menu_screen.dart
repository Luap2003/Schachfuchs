import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/content/content_manifest.dart';
import 'package:schach_app/core/models/puzzle_progress_view.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';
import 'package:schach_app/shared/widgets/app_back_button.dart';

class PuzzleMenuScreen extends StatelessWidget {
  const PuzzleMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Puzzle Packs'),
      ),
      body: FutureBuilder<_PuzzleMenuViewData>(
        future: _loadMenuViewData(),
        builder: (BuildContext context, AsyncSnapshot<_PuzzleMenuViewData> snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.hasError) {
              return Center(child: Text('Fehler: ${snapshot.error}'));
            }
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          final packs = data.manifest.puzzlePacks;
          return ListView.builder(
            itemCount: packs.length,
            itemBuilder: (BuildContext context, int index) {
              final pack = packs[index];
              final summary =
                  data.summaryByPackId[pack.id] ??
                  PuzzlePackProgressSummary(
                    packId: pack.id,
                    totalPuzzles: pack.count ?? 0,
                    solvedCount: 0,
                    attemptedCount: 0,
                  );
              final title = pack.title ?? pack.id;
              final category = (pack.category ?? 'puzzles').replaceAll(
                '_',
                ' ',
              );
              final difficulty = pack.difficulty == null
                  ? ''
                  : ' · Level ${pack.difficulty}';
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$category$difficulty · ${summary.totalPuzzles} Aufgaben',
                      ),
                      const SizedBox(height: 8),
                      _SegmentedProgressBar(
                        solvedCount: summary.solvedCount,
                        attemptedCount: summary.attemptedCount,
                        openCount: summary.openCount,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${summary.solvedCount}/${summary.totalPuzzles} gelöst · ${summary.attemptedCount} versucht · ${summary.openCount} offen',
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () => context.push('/puzzles/${pack.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<_PuzzleMenuViewData> _loadMenuViewData() async {
    final loader = getIt<ContentLoader>();
    final auth = getIt<AuthRepository>();
    final progressRepository = getIt<ProgressRepository>();

    final manifest = await loader.loadManifest();
    final packIds = manifest.puzzlePacks.map((entry) => entry.id).toList();
    final userId = await auth.getCurrentLocalUserId();
    final progressRows = await progressRepository.listPuzzleProgressByPacks(
      ownerUserId: userId,
      packIds: packIds,
    );

    final solvedByPack = <String, int>{};
    final attemptedByPack = <String, int>{};
    for (final row in progressRows) {
      if (row.isSolved) {
        solvedByPack[row.packId] = (solvedByPack[row.packId] ?? 0) + 1;
      } else {
        attemptedByPack[row.packId] = (attemptedByPack[row.packId] ?? 0) + 1;
      }
    }

    final summaryByPackId = <String, PuzzlePackProgressSummary>{};
    for (final pack in manifest.puzzlePacks) {
      summaryByPackId[pack.id] = PuzzlePackProgressSummary(
        packId: pack.id,
        totalPuzzles: pack.count ?? 0,
        solvedCount: solvedByPack[pack.id] ?? 0,
        attemptedCount: attemptedByPack[pack.id] ?? 0,
      );
    }

    return _PuzzleMenuViewData(
      manifest: manifest,
      summaryByPackId: summaryByPackId,
    );
  }
}

class _PuzzleMenuViewData {
  const _PuzzleMenuViewData({
    required this.manifest,
    required this.summaryByPackId,
  });

  final ContentManifest manifest;
  final Map<String, PuzzlePackProgressSummary> summaryByPackId;
}

class _SegmentedProgressBar extends StatelessWidget {
  const _SegmentedProgressBar({
    required this.solvedCount,
    required this.attemptedCount,
    required this.openCount,
  });

  final int solvedCount;
  final int attemptedCount;
  final int openCount;

  @override
  Widget build(BuildContext context) {
    final total = solvedCount + attemptedCount + openCount;
    if (total <= 0) {
      return const SizedBox(height: 8);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 8,
        child: Row(
          children: <Widget>[
            if (solvedCount > 0)
              Expanded(
                flex: solvedCount,
                child: const ColoredBox(color: Colors.green),
              ),
            if (attemptedCount > 0)
              Expanded(
                flex: attemptedCount,
                child: const ColoredBox(color: Colors.amber),
              ),
            if (openCount > 0)
              Expanded(
                flex: openCount,
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
