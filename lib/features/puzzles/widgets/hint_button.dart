import 'package:flutter/material.dart';

class HintButton extends StatelessWidget {
  const HintButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.lightbulb_outline),
      label: const Text('Hinweis'),
    );
  }
}
