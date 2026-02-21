import 'package:flutter/material.dart';
import 'package:schach_app/features/lessons/widgets/step_guided_move.dart';

class StepFreePlay extends StatelessWidget {
  const StepFreePlay({
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
    return StepGuidedMove(
      text: text,
      moves: moves,
      selectedMove: selectedMove,
      feedback: feedback,
      onSelectMove: onSelectMove,
      onSubmit: onSubmit,
      onHint: onHint,
    );
  }
}
