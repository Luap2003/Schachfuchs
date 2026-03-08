import 'package:flutter/material.dart';
import 'package:schach_app/shared/widgets/chess_board_widget.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    required this.fen,
    required this.legalMoves,
    required this.onUserMoveUci,
    required this.isInputLocked,
    super.key,
  });

  final String fen;
  final List<String> legalMoves;
  final ValueChanged<String> onUserMoveUci;
  final bool isInputLocked;

  @override
  Widget build(BuildContext context) {
    return ChessBoardWidget(
      fen: fen,
      enableUserMoves: true,
      isInputLocked: isInputLocked,
      onUserMoveUci: onUserMoveUci,
      legalMoves: legalMoves,
    );
  }
}
