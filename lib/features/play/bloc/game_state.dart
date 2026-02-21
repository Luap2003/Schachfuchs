part of 'game_bloc.dart';

enum GameStatus { initial, ready, finished }

class GameState extends Equatable {
  const GameState({
    this.status = GameStatus.initial,
    this.boardState,
    this.legalMoves = const <String>[],
    this.isOpponentThinking = false,
    this.opponentName = 'AI',
    this.errorMessage,
    this.resultMessage,
  });

  final GameStatus status;
  final BoardState? boardState;
  final List<String> legalMoves;
  final bool isOpponentThinking;
  final String opponentName;
  final String? errorMessage;
  final String? resultMessage;

  GameState copyWith({
    GameStatus? status,
    BoardState? boardState,
    List<String>? legalMoves,
    bool? isOpponentThinking,
    String? opponentName,
    String? errorMessage,
    String? resultMessage,
    bool clearMessages = false,
  }) {
    return GameState(
      status: status ?? this.status,
      boardState: boardState ?? this.boardState,
      legalMoves: legalMoves ?? this.legalMoves,
      isOpponentThinking: isOpponentThinking ?? this.isOpponentThinking,
      opponentName: opponentName ?? this.opponentName,
      errorMessage: clearMessages ? null : (errorMessage ?? this.errorMessage),
      resultMessage: clearMessages
          ? null
          : (resultMessage ?? this.resultMessage),
    );
  }

  @override
  List<Object?> get props => <Object?>[
    status,
    boardState,
    legalMoves,
    isOpponentThinking,
    opponentName,
    errorMessage,
    resultMessage,
  ];
}
