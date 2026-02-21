import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/content/content_manifest.dart';

class LessonListScreen extends StatelessWidget {
  const LessonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lektionen')),
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

              final lessons = snapshot.data!.lessons;
              return ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (BuildContext context, int index) {
                  final lesson = lessons[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(lesson.id),
                      subtitle: Text('Version ${lesson.version}'),
                      trailing: const Icon(Icons.play_arrow),
                      onTap: () => context.go('/lessons/${lesson.id}'),
                    ),
                  );
                },
              );
            },
      ),
    );
  }
}
