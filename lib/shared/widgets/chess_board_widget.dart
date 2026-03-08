import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart' as fcb;
import 'package:schach_app/shared/theme/board_theme.dart';

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
    this.legalMoves = const <String>[],
    this.highlightSquares = const <String>[],
    this.arrows = const <ChessArrowData>[],
    this.size,
  });

  final String fen;
  final bool enableUserMoves;
  final bool isInputLocked;
  final int positionVersion;
  final ValueChanged<String>? onUserMoveUci;
  final List<String> legalMoves;
  final List<String> highlightSquares;
  final List<ChessArrowData> arrows;
  final double? size;

  @override
  State<ChessBoardWidget> createState() => _ChessBoardWidgetState();
}

class _ChessBoardWidgetState extends State<ChessBoardWidget> {
  late fcb.ChessBoardController _controller;
  String? _selectedSquare;

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
      _selectedSquare = null;
    }

    if ((oldWidget.isInputLocked != widget.isInputLocked &&
            widget.isInputLocked) ||
        (oldWidget.enableUserMoves != widget.enableUserMoves &&
            !widget.enableUserMoves)) {
      _selectedSquare = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final legalMovesByFrom = _groupLegalMovesByFrom(widget.legalMoves);
    final selectedSquare = _selectedSquare;
    final selectedMoves = selectedSquare == null
        ? const <String>[]
        : legalMovesByFrom[selectedSquare] ?? const <String>[];
    final selectedDestinations = selectedMoves
        .map((move) => move.substring(2, 4))
        .toSet();
    final occupiedSquares = _occupiedSquaresFromFen(widget.fen);
    final isInputEnabled =
        widget.enableUserMoves &&
        !widget.isInputLocked &&
        widget.onUserMoveUci != null;

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
            enableUserMoves: false,
            arrows: boardArrows,
            size: widget.size,
          ),
          IgnorePointer(
            child: GridView.builder(
              itemCount: 64,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final square = _squareFromBoardIndex(index);
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
          IgnorePointer(
            child: GridView.builder(
              itemCount: 64,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final square = _squareFromBoardIndex(index);
                final isSelected = square == selectedSquare;
                final isLegalDestination = selectedDestinations.contains(
                  square,
                );
                final isCapture = occupiedSquares.contains(square);
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  color: isSelected
                      ? Colors.blue.withValues(alpha: 0.22)
                      : Colors.transparent,
                  child: isLegalDestination
                      ? Center(
                          child: isCapture
                              ? Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black.withValues(
                                        alpha: 0.45,
                                      ),
                                      width: 4,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withValues(alpha: 0.35),
                                  ),
                                ),
                        )
                      : null,
                );
              },
            ),
          ),
          if (isInputEnabled)
            GridView.builder(
              itemCount: 64,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final square = _squareFromBoardIndex(index);
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _onSquareTap(
                    square: square,
                    legalMovesByFrom: legalMovesByFrom,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  fcb.ChessBoardController _newController(String fen) {
    return fcb.ChessBoardController.fromFEN(fen);
  }

  void _onSquareTap({
    required String square,
    required Map<String, List<String>> legalMovesByFrom,
  }) {
    final callback = widget.onUserMoveUci;
    if (callback == null) {
      return;
    }

    final selectedSquare = _selectedSquare;
    if (selectedSquare == null) {
      if (legalMovesByFrom.containsKey(square)) {
        setState(() => _selectedSquare = square);
      }
      return;
    }

    if (selectedSquare == square) {
      setState(() => _selectedSquare = null);
      return;
    }

    final matchingMoves =
        legalMovesByFrom[selectedSquare]
            ?.where((move) => move.substring(2, 4) == square)
            .toList(growable: false) ??
        const <String>[];

    if (matchingMoves.isNotEmpty) {
      setState(() => _selectedSquare = null);
      callback(_pickMoveForDestination(matchingMoves));
      return;
    }

    if (legalMovesByFrom.containsKey(square)) {
      setState(() => _selectedSquare = square);
      return;
    }

    setState(() => _selectedSquare = null);
  }

  String _pickMoveForDestination(List<String> matchingMoves) {
    for (final move in matchingMoves) {
      if (move.length == 5 && move.endsWith('q')) {
        return move;
      }
    }
    return matchingMoves.first;
  }

  String _squareFromBoardIndex(int index) {
    final file = index % 8;
    final rank = 8 - (index ~/ 8);
    return '${String.fromCharCode(97 + file)}$rank';
  }

  Map<String, List<String>> _groupLegalMovesByFrom(List<String> legalMoves) {
    final grouped = <String, List<String>>{};
    for (final move in legalMoves) {
      if (move.length < 4) {
        continue;
      }
      final from = move.substring(0, 2);
      grouped.putIfAbsent(from, () => <String>[]).add(move);
    }
    return grouped;
  }

  Set<String> _occupiedSquaresFromFen(String fen) {
    final fenParts = fen.split(' ');
    if (fenParts.isEmpty || fenParts.first.isEmpty) {
      return <String>{};
    }
    final boardState = fenParts.first;

    final occupied = <String>{};
    final ranks = boardState.split('/');
    for (
      var rankIndex = 0;
      rankIndex < ranks.length && rankIndex < 8;
      rankIndex++
    ) {
      var file = 0;
      for (final symbol in ranks[rankIndex].split('')) {
        final emptyCount = int.tryParse(symbol);
        if (emptyCount != null) {
          file += emptyCount;
          continue;
        }

        if (file > 7) {
          break;
        }
        final square = '${String.fromCharCode(97 + file)}${8 - rankIndex}';
        occupied.add(square);
        file += 1;
      }
    }
    return occupied;
  }
}
