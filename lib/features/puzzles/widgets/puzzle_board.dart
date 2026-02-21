import 'package:flutter/material.dart';
import 'package:schach_app/shared/widgets/chess_board_widget.dart';

class PuzzleBoard extends StatelessWidget {
  const PuzzleBoard({
    required this.fen,
    required this.positionVersion,
    required this.onUserMoveUci,
    this.isInputLocked = false,
    super.key,
  });

  final String fen;
  final int positionVersion;
  final ValueChanged<String> onUserMoveUci;
  final bool isInputLocked;

  @override
  Widget build(BuildContext context) {
    return ChessBoardWidget(
      fen: fen,
      positionVersion: positionVersion,
      enableUserMoves: true,
      isInputLocked: isInputLocked,
      onUserMoveUci: onUserMoveUci,
    );
  }
}
