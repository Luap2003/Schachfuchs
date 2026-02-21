import 'package:flutter/material.dart';

class DailyPuzzleCard extends StatelessWidget {
  const DailyPuzzleCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.extension),
        title: const Text('Puzzle spielen'),
        subtitle: const Text('Löse Taktik-Aufgaben offline.'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
