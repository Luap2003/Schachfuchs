import 'package:flutter/material.dart';
import 'package:schach_app/config/feature_flags.dart';

class StepGuidedMove extends StatelessWidget {
  const StepGuidedMove({
    required this.text,
    required this.feedback,
    required this.onHint,
    required this.requiresResetToRetry,
    required this.onReset,
    required this.moves,
    required this.selectedMove,
    required this.onSelectMove,
    required this.onSubmitDebug,
    super.key,
  });

  final String text;
  final String? feedback;
  final VoidCallback onHint;
  final bool requiresResetToRetry;
  final VoidCallback onReset;

  final List<String> moves;
  final String? selectedMove;
  final ValueChanged<String?> onSelectMove;
  final VoidCallback onSubmitDebug;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(text, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        const Text('Ziehe eine Figur per Drag-and-Drop auf das Zielfeld.'),
        const SizedBox(height: 10),
        if (FeatureFlags.manualMoveDebugEnabled) ...<Widget>[
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
              labelText: 'Waehle deinen Zug (Debug)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onSubmitDebug,
            child: const Text('Debug: Zug pruefen'),
          ),
          const SizedBox(height: 8),
        ],
        Row(
          children: <Widget>[
            OutlinedButton(onPressed: onHint, child: const Text('Hinweis')),
            const SizedBox(width: 8),
            if (requiresResetToRetry)
              ElevatedButton(
                onPressed: onReset,
                child: const Text('Startposition'),
              ),
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
