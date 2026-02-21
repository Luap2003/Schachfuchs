import 'package:flutter/material.dart';

class GameControls extends StatelessWidget {
  const GameControls({required this.onNewGame, super.key});

  final VoidCallback onNewGame;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton(
            onPressed: onNewGame,
            child: const Text('Neues Spiel'),
          ),
        ),
      ],
    );
  }
}
