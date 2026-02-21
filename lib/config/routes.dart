import 'package:go_router/go_router.dart';
import 'package:schach_app/features/home/screens/home_screen.dart';
import 'package:schach_app/features/lessons/screens/lesson_list_screen.dart';
import 'package:schach_app/features/lessons/screens/lesson_player_screen.dart';
import 'package:schach_app/features/play/screens/game_screen.dart';
import 'package:schach_app/features/play/screens/play_menu_screen.dart';
import 'package:schach_app/features/puzzles/screens/puzzle_menu_screen.dart';
import 'package:schach_app/features/puzzles/screens/puzzle_player_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/lessons',
      builder: (context, state) => const LessonListScreen(),
    ),
    GoRoute(
      path: '/lessons/:lessonId',
      builder: (context, state) {
        final lessonId = state.pathParameters['lessonId']!;
        return LessonPlayerScreen(lessonId: lessonId);
      },
    ),
    GoRoute(
      path: '/puzzles',
      builder: (context, state) => const PuzzleMenuScreen(),
    ),
    GoRoute(
      path: '/puzzles/:packId',
      builder: (context, state) {
        final packId = state.pathParameters['packId']!;
        return PuzzlePlayerScreen(packId: packId);
      },
    ),
    GoRoute(path: '/play', builder: (context, state) => const PlayMenuScreen()),
    GoRoute(
      path: '/play/game/:skillLevel',
      builder: (context, state) {
        final skillLevel =
            int.tryParse(state.pathParameters['skillLevel'] ?? '3') ?? 3;
        return GameScreen(skillLevel: skillLevel);
      },
    ),
    GoRoute(
      path: '/play/game/:skillLevel/resume/:savedGameId',
      builder: (context, state) {
        final skillLevel =
            int.tryParse(state.pathParameters['skillLevel'] ?? '3') ?? 3;
        final savedGameId = int.tryParse(
          state.pathParameters['savedGameId'] ?? '',
        );
        return GameScreen(skillLevel: skillLevel, savedGameId: savedGameId);
      },
    ),
  ],
);
