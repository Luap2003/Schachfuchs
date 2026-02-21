import 'package:flutter/material.dart';

class StepExplanation extends StatelessWidget {
  const StepExplanation({
    required this.text,
    required this.onContinue,
    super.key,
  });

  final String text;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(text, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: onContinue, child: const Text('Weiter')),
      ],
    );
  }
}
