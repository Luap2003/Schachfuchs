import 'package:flutter/material.dart';

class PuzzleResultDialog extends StatelessWidget {
  const PuzzleResultDialog({
    required this.message,
    required this.onClose,
    super.key,
  });

  final String message;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Puzzle Ergebnis'),
      content: Text(message),
      actions: <Widget>[
        TextButton(onPressed: onClose, child: const Text('OK')),
      ],
    );
  }
}
