import 'package:flutter/material.dart';

class ContinueLessonCard extends StatelessWidget {
  const ContinueLessonCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.menu_book),
        title: const Text('Lerne Lektionen'),
        subtitle: const Text('Figuren und Regeln Schritt fuer Schritt.'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
