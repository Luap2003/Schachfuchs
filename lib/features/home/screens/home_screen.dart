import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schach_app/features/home/widgets/continue_lesson_card.dart';
import 'package:schach_app/features/home/widgets/daily_puzzle_card.dart';
import 'package:schach_app/features/home/widgets/quick_play_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schach Lernen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Was moechtest du heute trainieren?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ContinueLessonCard(onTap: () => context.go('/lessons')),
            DailyPuzzleCard(onTap: () => context.go('/puzzles')),
            QuickPlayCard(onTap: () => context.go('/play')),
          ],
        ),
      ),
    );
  }
}
