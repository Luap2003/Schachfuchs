import 'package:flutter/material.dart';
import 'package:schach_app/shared/widgets/chess_board_widget.dart';

class PuzzleBoard extends StatelessWidget {
  const PuzzleBoard({required this.fen, super.key});

  final String fen;

  @override
  Widget build(BuildContext context) {
    return ChessBoardWidget(fen: fen);
  }
}
