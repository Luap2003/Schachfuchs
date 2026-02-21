import 'package:flutter/material.dart';
import 'package:schach_app/features/lessons/widgets/step_guided_move.dart';

class StepFreePlay extends StatelessWidget {
  const StepFreePlay({
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
    return StepGuidedMove(
      text: text,
      feedback: feedback,
      onHint: onHint,
      requiresResetToRetry: requiresResetToRetry,
      onReset: onReset,
      moves: moves,
      selectedMove: selectedMove,
      onSelectMove: onSelectMove,
      onSubmitDebug: onSubmitDebug,
    );
  }
}
