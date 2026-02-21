import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart' as fcb;
import 'package:schach_app/shared/theme/board_theme.dart';
import 'package:schach_app/shared/widgets/uci_move_mapper.dart';

class ChessArrowData {
  const ChessArrowData({
    required this.from,
    required this.to,
    this.color = Colors.green,
  });

  final String from;
  final String to;
  final Color color;
}

class ChessBoardWidget extends StatefulWidget {
  const ChessBoardWidget({
    required this.fen,
    super.key,
    this.enableUserMoves = false,
    this.isInputLocked = false,
    this.positionVersion = 0,
    this.onUserMoveUci,
    this.highlightSquares = const <String>[],
    this.arrows = const <ChessArrowData>[],
    this.size,
  });

  final String fen;
  final bool enableUserMoves;
  final bool isInputLocked;
  final int positionVersion;
  final ValueChanged<String>? onUserMoveUci;
  final List<String> highlightSquares;
  final List<ChessArrowData> arrows;
  final double? size;

  @override
  State<ChessBoardWidget> createState() => _ChessBoardWidgetState();
}

class _ChessBoardWidgetState extends State<ChessBoardWidget> {
  late fcb.ChessBoardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _newController(widget.fen);
  }

  @override
  void didUpdateWidget(covariant ChessBoardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final fenChanged = oldWidget.fen != widget.fen;
    final versionChanged = oldWidget.positionVersion != widget.positionVersion;

    if (fenChanged || versionChanged) {
      _controller = _newController(widget.fen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final boardArrows = widget.arrows
        .map(
          (arrow) => fcb.BoardArrow(
            from: arrow.from,
            to: arrow.to,
            color: arrow.color.withValues(alpha: 0.65),
          ),
        )
        .toList(growable: false);

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          fcb.ChessBoard(
            controller: _controller,
            boardColor: fcb.BoardColor.green,
            enableUserMoves: widget.enableUserMoves && !widget.isInputLocked,
            arrows: boardArrows,
            size: widget.size,
            onMove: _onBoardMove,
          ),
          IgnorePointer(
            child: GridView.builder(
              itemCount: 64,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final file = index % 8;
                final rank = 8 - (index ~/ 8);
                final square = '${String.fromCharCode(97 + file)}$rank';
                final isHighlighted = widget.highlightSquares.contains(square);
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  color: isHighlighted
                      ? BoardTheme.highlight
                      : Colors.transparent,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  fcb.ChessBoardController _newController(String fen) {
    return fcb.ChessBoardController.fromFEN(fen);
  }

  void _onBoardMove() {
    final onUserMoveUci = widget.onUserMoveUci;
    if (onUserMoveUci == null) {
      return;
    }

    final history = _controller.game.getHistory({'verbose': true});
    if (history.isEmpty) {
      return;
    }

    final lastEntry = history.last as Map<String, dynamic>;
    final uci = UciMoveMapper.fromVerboseHistoryEntry(lastEntry);
    if (uci != null) {
      onUserMoveUci(uci);
    }
  }
}
