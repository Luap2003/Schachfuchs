import 'package:flutter/material.dart';

class QuickPlayCard extends StatelessWidget {
  const QuickPlayCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.sports_esports),
        title: const Text('Gegen KI spielen'),
        subtitle: const Text('Wähle einen kindgerechten Schwierigkeitsgrad.'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
