import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/content/content_manifest.dart';
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
      body: FutureBuilder<ContentManifest>(
        future: getIt<ContentLoader>().loadManifest(),
        builder:
            (BuildContext context, AsyncSnapshot<ContentManifest> snapshot) {
              if (!snapshot.hasData) {
                if (snapshot.hasError) {
                  return Center(child: Text('Fehler: ${snapshot.error}'));
                }
                return const Center(child: CircularProgressIndicator());
              }

              final packs = snapshot.data!.puzzlePacks;
              return ListView.builder(
                itemCount: packs.length,
                itemBuilder: (BuildContext context, int index) {
                  final pack = packs[index];
                  final title = pack.title ?? pack.id;
                  final category = (pack.category ?? 'puzzles').replaceAll(
                    '_',
                    ' ',
                  );
                  final difficulty = pack.difficulty == null
                      ? ''
                      : ' · Level ${pack.difficulty}';
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(title),
                      subtitle: Text(
                        '$category$difficulty · ${pack.count ?? 0} Aufgaben',
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
}
