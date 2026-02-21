import 'package:flutter/material.dart';
import 'package:schach_app/config/feature_flags.dart';

class GameMoveInputSection extends StatelessWidget {
  const GameMoveInputSection({
    required this.legalMoves,
    required this.isInputLocked,
    required this.onMove,
    super.key,
  });

  final List<String> legalMoves;
  final bool isInputLocked;
  final ValueChanged<String> onMove;

  @override
  Widget build(BuildContext context) {
    if (!FeatureFlags.manualMoveDebugEnabled) {
      return const SizedBox.shrink();
    }

    return DropdownButtonFormField<String>(
      hint: const Text('Wähle deinen Zug (Debug)'),
      items: legalMoves
          .map(
            (move) => DropdownMenuItem<String>(value: move, child: Text(move)),
          )
          .toList(growable: false),
      onChanged: isInputLocked
          ? null
          : (String? value) {
              if (value != null) {
                onMove(value);
              }
            },
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
