import 'package:flutter/material.dart';

class StepGuidedMove extends StatelessWidget {
  const StepGuidedMove({
    required this.text,
    required this.moves,
    required this.selectedMove,
    required this.feedback,
    required this.onSelectMove,
    required this.onSubmit,
    required this.onHint,
    super.key,
  });

  final String text;
  final List<String> moves;
  final String? selectedMove;
  final String? feedback;
  final ValueChanged<String?> onSelectMove;
  final VoidCallback onSubmit;
  final VoidCallback onHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(text, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          key: ValueKey<String?>(selectedMove),
          initialValue: selectedMove,
          items: moves
              .map(
                (move) =>
                    DropdownMenuItem<String>(value: move, child: Text(move)),
              )
              .toList(growable: false),
          onChanged: onSelectMove,
          decoration: const InputDecoration(
            labelText: 'Waehle deinen Zug',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: onSubmit,
                child: const Text('Zug pruefen'),
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton(onPressed: onHint, child: const Text('Hinweis')),
          ],
        ),
        if (feedback != null) ...<Widget>[
          const SizedBox(height: 8),
          Text(feedback!),
        ],
      ],
    );
  }
}
