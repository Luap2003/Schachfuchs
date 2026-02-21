import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schach_app/shared/widgets/app_back_button.dart';

class PlayMenuScreen extends StatelessWidget {
  const PlayMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Gegen KI spielen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _LevelTile(
            title: 'Leicht - Friendly Pawn',
            subtitle: 'Ideal fuer den Einstieg',
            onTap: () => context.push('/play/game/3'),
          ),
          _LevelTile(
            title: 'Mittel - Clever Knight',
            subtitle: 'Mehr Taktik, aber fair',
            onTap: () => context.push('/play/game/6'),
          ),
          _LevelTile(
            title: 'Schwer - Mighty Rook',
            subtitle: 'Starker Gegner',
            onTap: () => context.push('/play/game/12'),
          ),
        ],
      ),
    );
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
