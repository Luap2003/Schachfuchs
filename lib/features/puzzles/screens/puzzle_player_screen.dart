import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/config/feature_flags.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/storage/repositories/auth_repository.dart';
import 'package:schach_app/core/storage/repositories/progress_repository.dart';
import 'package:schach_app/features/puzzles/bloc/puzzle_player_bloc.dart';
import 'package:schach_app/features/puzzles/widgets/hint_button.dart';
import 'package:schach_app/features/puzzles/widgets/puzzle_board.dart';
import 'package:schach_app/shared/widgets/app_back_button.dart';

class PuzzlePlayerScreen extends StatelessWidget {
  const PuzzlePlayerScreen({required this.packId, super.key});

  final String packId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PuzzlePlayerBloc>(
      create: (_) => PuzzlePlayerBloc(
        contentLoader: getIt<ContentLoader>(),
        engine: getIt<ChessEngine>(),
        progressRepository: getIt<ProgressRepository>(),
        authRepository: getIt<AuthRepository>(),
      )..loadPack(packId),
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButton(),
          title: const Text('Puzzle spielen'),
        ),
        body: BlocBuilder<PuzzlePlayerBloc, PuzzlePlayerState>(
          builder: (BuildContext context, PuzzlePlayerState state) {
            if (state.status == PuzzlePlayerStatus.loading ||
                state.status == PuzzlePlayerStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == PuzzlePlayerStatus.error) {
              return Center(
                child: Text(state.errorMessage ?? 'Unbekannter Fehler'),
              );
            }

            final puzzle = state.currentPuzzle;
            if (puzzle == null) {
              return const Center(child: Text('Keine Puzzle gefunden.'));
            }

            final bloc = context.read<PuzzlePlayerBloc>();

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    state.pack?.title ?? 'Puzzle',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Aufgabe ${state.puzzleIndex + 1}/${state.pack!.puzzles.length}',
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: PuzzleBoard(
                      fen: state.boardFen ?? puzzle.fen,
                      positionVersion: state.positionVersion,
                      isInputLocked:
                          state.status == PuzzlePlayerStatus.completed,
                      onUserMoveUci: bloc.onUserMove,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Ziehe eine Figur per Drag-and-Drop auf das Zielfeld.',
                  ),
                  const SizedBox(height: 8),
                  if (FeatureFlags.manualMoveDebugEnabled) ...<Widget>[
                    DropdownButtonFormField<String>(
                      key: ValueKey<String?>(state.selectedMove),
                      initialValue: state.selectedMove,
                      items: state.legalMoves
                          .map(
                            (move) => DropdownMenuItem<String>(
                              value: move,
                              child: Text(move),
                            ),
                          )
                          .toList(growable: false),
                      onChanged: (String? value) {
                        if (value != null) {
                          bloc.selectMove(value);
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Dein Zug (Debug)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: bloc.submitMove,
                      child: const Text('Debug: Pruefen'),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (state.status != PuzzlePlayerStatus.completed)
                    Row(
                      children: <Widget>[
                        HintButton(onPressed: bloc.showHint),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: bloc.resetCurrentPuzzlePosition,
                          child: const Text('Startposition'),
                        ),
                      ],
                    ),
                  if (state.feedback != null) ...<Widget>[
                    const SizedBox(height: 8),
                    Text(state.feedback!),
                  ],
                  if (state.status == PuzzlePlayerStatus.completed) ...<Widget>[
                    const SizedBox(height: 8),
                    const Text(
                      'Puzzle-Pack abgeschlossen! Stark!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: bloc.restartPackFromBeginning,
                      child: const Text('Von vorne starten'),
                    ),
                  ] else if (state.solved) ...<Widget>[
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: bloc.nextPuzzle,
                      child: const Text('Naechstes Puzzle'),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
