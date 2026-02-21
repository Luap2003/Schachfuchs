import 'package:flutter/material.dart';

class MoveHistoryPanel extends StatelessWidget {
  const MoveHistoryPanel({required this.moves, super.key});

  final List<String> moves;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[Text(moves.join(' '))],
        ),
      ),
    );
  }
}
