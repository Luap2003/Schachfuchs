import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/opponent/ai_opponent.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/game_history_repository.dart';
import 'package:schach_app/features/play/bloc/game_bloc.dart';
import 'package:schach_app/features/play/widgets/game_board.dart';
import 'package:schach_app/features/play/widgets/game_controls.dart';
import 'package:schach_app/features/play/widgets/game_move_input_section.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({required this.skillLevel, super.key});

  final int skillLevel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      create: (_) => GameBloc(
        engine: getIt<ChessEngine>(),
        opponent: AiOpponent(skillLevel: skillLevel),
        authRepository: getIt<AuthRepository>(),
        gameHistoryRepository: getIt<GameHistoryRepository>(),
      )..startGame(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Spiel gegen KI')),
        body: BlocBuilder<GameBloc, GameState>(
          builder: (BuildContext context, GameState state) {
            final bloc = context.read<GameBloc>();
            final fen =
                state.boardState?.fen ??
                'rn1qkbnr/pppb1ppp/4p3/3p4/8/3P1N2/PPP1PPPP/RNBQKB1R w KQkq - 0 1';

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Gegner: ${state.opponentName}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: GameBoard(
                      fen: fen,
                      isInputLocked:
                          state.isOpponentThinking ||
                          state.status == GameStatus.finished,
                      onUserMoveUci: bloc.playMove,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Ziehe eine Figur auf das Zielfeld.'),
                  const SizedBox(height: 8),
                  GameMoveInputSection(
                    legalMoves: state.legalMoves,
                    isInputLocked:
                        state.isOpponentThinking ||
                        state.status == GameStatus.finished,
                    onMove: bloc.playMove,
                  ),
                  if (state.isOpponentThinking) ...<Widget>[
                    const SizedBox(height: 8),
                    const Text('KI denkt nach...'),
                  ],
                  if (state.errorMessage != null) ...<Widget>[
                    const SizedBox(height: 8),
                    Text(state.errorMessage!),
                  ],
                  if (state.resultMessage != null) ...<Widget>[
                    const SizedBox(height: 8),
                    Text(
                      state.resultMessage!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                  const SizedBox(height: 8),
                  GameControls(onNewGame: bloc.startGame),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
