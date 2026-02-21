import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/models/saved_ai_game.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/saved_ai_game_repository.dart';
import 'package:schach_app/shared/widgets/app_back_button.dart';

class PlayMenuScreen extends StatefulWidget {
  const PlayMenuScreen({super.key});

  @override
  State<PlayMenuScreen> createState() => _PlayMenuScreenState();
}

class _PlayMenuScreenState extends State<PlayMenuScreen> {
  late Future<List<SavedAiGame>> _savedGamesFuture;

  @override
  void initState() {
    super.initState();
    _savedGamesFuture = _loadSavedGames();
  }

  Future<List<SavedAiGame>> _loadSavedGames() async {
    final userId = await getIt<AuthRepository>().getCurrentLocalUserId();
    return getIt<SavedAiGameRepository>().listByUser(ownerUserId: userId);
  }

  void _refreshSavedGames() {
    setState(() {
      _savedGamesFuture = _loadSavedGames();
    });
  }

  Future<void> _openRoute(String route) async {
    await context.push(route);
    if (!mounted) {
      return;
    }
    _refreshSavedGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Gegen KI spielen'),
      ),
      body: FutureBuilder<List<SavedAiGame>>(
        future: _savedGamesFuture,
        builder: (BuildContext context, AsyncSnapshot<List<SavedAiGame>> snapshot) {
          final savedGames = snapshot.data ?? const <SavedAiGame>[];
          return ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              if (snapshot.connectionState == ConnectionState.waiting)
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Center(child: CircularProgressIndicator()),
                ),
              if (snapshot.hasError)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Fehler beim Laden gespeicherter Spiele: ${snapshot.error}',
                  ),
                ),
              if (!snapshot.hasError && savedGames.isNotEmpty) ...<Widget>[
                const Text(
                  'Spiel fortsetzen',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...savedGames.map(
                  (savedGame) => Card(
                    child: ListTile(
                      title: Text(
                        '${_complexityLabel(savedGame.skillLevel)} (${savedGame.skillLevel})',
                      ),
                      subtitle: Text(
                        'Zuletzt gespielt: ${_formatDateTime(savedGame.updatedAt)}',
                      ),
                      trailing: const Icon(Icons.play_arrow),
                      onTap: () => _openRoute(
                        '/play/game/${savedGame.skillLevel}/resume/${savedGame.id}',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              const Text(
                'Neues Spiel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _LevelTile(
                title: 'Leicht - Friendly Pawn',
                subtitle: 'Ideal für den Einstieg',
                onTap: () => _openRoute('/play/game/3'),
              ),
              _LevelTile(
                title: 'Mittel - Clever Knight',
                subtitle: 'Mehr Taktik, aber fair',
                onTap: () => _openRoute('/play/game/6'),
              ),
              _LevelTile(
                title: 'Schwer - Mighty Rook',
                subtitle: 'Starker Gegner',
                onTap: () => _openRoute('/play/game/12'),
              ),
            ],
          );
        },
      ),
    );
  }

  String _complexityLabel(int skillLevel) {
    if (skillLevel <= 3) {
      return 'Leicht';
    }
    if (skillLevel <= 6) {
      return 'Mittel';
    }
    if (skillLevel <= 12) {
      return 'Schwer';
    }
    return 'Stufe';
  }

  String _formatDateTime(DateTime dateTime) {
    final local = dateTime.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$day.$month.${local.year} $hour:$minute';
  }
}

class _LevelTile extends StatelessWidget {
  const _LevelTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.play_arrow),
        onTap: onTap,
      ),
    );
  }
}
