import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schach_app/config/di.dart';
import 'package:schach_app/config/feature_flags.dart';
import 'package:schach_app/core/content/content_loader.dart';
import 'package:schach_app/core/engine/chess_engine.dart';
import 'package:schach_app/core/models/puzzle_progress_view.dart';
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
          actions: <Widget>[
            BlocBuilder<PuzzlePlayerBloc, PuzzlePlayerState>(
              builder: (BuildContext context, PuzzlePlayerState state) {
                return IconButton(
                  icon: const Icon(Icons.list_alt),
                  onPressed: state.pack == null
                      ? null
                      : () => _showPuzzleIndex(context),
                );
              },
            ),
          ],
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
            final currentPuzzleStatus = state.currentPuzzleStatus;
            final isWhiteToMove = _isWhiteToMove(puzzle.fen);
            final currentMoveDisplay = state.solved
                ? puzzle.playerMoves.length
                : state.currentPlayerMoveIndex + 1;

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
                  _SegmentedProgressBar(
                    solvedCount: state.solvedCount,
                    attemptedCount: state.attemptedCount,
                    openCount: state.openCount,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${state.solvedCount}/${state.totalPuzzles} gelöst · ${state.attemptedCount} versucht · ${state.openCount} offen',
                  ),
                  const SizedBox(height: 8),
                  Text('Du spielst: ${isWhiteToMove ? 'Weiss' : 'Schwarz'}'),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        'Aufgabe ${state.puzzleIndex + 1}/${state.pack!.puzzles.length}',
                      ),
                      _PuzzleStatusChip(status: currentPuzzleStatus),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Zug $currentMoveDisplay/${puzzle.playerMoves.length}'),
                  const SizedBox(height: 12),
                  Expanded(
                    child: PuzzleBoard(
                      fen: state.boardFen ?? puzzle.fen,
                      legalMoves: state.legalMoves,
                      positionVersion: state.positionVersion,
                      isInputLocked: false,
                      onUserMoveUci: bloc.onUserMove,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Tippe eine Figur an und dann auf ein Zielfeld.'),
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
                      child: const Text('Debug: Prüfen'),
                    ),
                    const SizedBox(height: 8),
                  ],
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
                  if (state.solved &&
                      puzzle.solutionSan.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 8),
                    Text(
                      'Lösung (SAN): ${puzzle.solutionSan.join(' ')}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                  if (state.solved) ...<Widget>[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: bloc.nextPuzzle,
                          child: const Text('Nächstes Puzzle'),
                        ),
                        OutlinedButton(
                          onPressed: bloc.goToNextUnsolvedPuzzle,
                          child: const Text('Nächstes Offenes'),
                        ),
                      ],
                    ),
                  ],
                  if (!state.solved) ...<Widget>[
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: bloc.restartPackFromBeginning,
                      child: const Text('Zu Puzzle 1'),
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

  void _showPuzzleIndex(BuildContext context) {
    final bloc = context.read<PuzzlePlayerBloc>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext sheetContext) {
        return BlocProvider<PuzzlePlayerBloc>.value(
          value: bloc,
          child: const _PuzzleIndexSheet(),
        );
      },
    );
  }
}

class _PuzzleIndexSheet extends StatelessWidget {
  const _PuzzleIndexSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PuzzlePlayerBloc, PuzzlePlayerState>(
        builder: (BuildContext context, PuzzlePlayerState state) {
          final pack = state.pack;
          if (pack == null) {
            return const SizedBox.shrink();
          }
          final bloc = context.read<PuzzlePlayerBloc>();
          final filteredIndices = _filteredIndices(state);
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Puzzle Index',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  _SegmentedProgressBar(
                    solvedCount: state.solvedCount,
                    attemptedCount: state.attemptedCount,
                    openCount: state.openCount,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${state.solvedCount}/${state.totalPuzzles} gelöst · ${state.attemptedCount} versucht · ${state.openCount} offen',
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      _FilterChip(
                        label: 'Alle',
                        selected: state.indexFilter == PuzzleStatusFilter.all,
                        onTap: () =>
                            bloc.setIndexFilter(PuzzleStatusFilter.all),
                      ),
                      _FilterChip(
                        label: 'Offen',
                        selected: state.indexFilter == PuzzleStatusFilter.open,
                        onTap: () =>
                            bloc.setIndexFilter(PuzzleStatusFilter.open),
                      ),
                      _FilterChip(
                        label: 'Versucht',
                        selected:
                            state.indexFilter == PuzzleStatusFilter.attempted,
                        onTap: () =>
                            bloc.setIndexFilter(PuzzleStatusFilter.attempted),
                      ),
                      _FilterChip(
                        label: 'Gelöst',
                        selected:
                            state.indexFilter == PuzzleStatusFilter.solved,
                        onTap: () =>
                            bloc.setIndexFilter(PuzzleStatusFilter.solved),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.separated(
                      itemCount: filteredIndices.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (BuildContext context, int listIndex) {
                        final puzzleIndex = filteredIndices[listIndex];
                        final puzzle = pack.puzzles[puzzleIndex];
                        final status =
                            state.puzzleStatusesById[puzzle.id] ??
                            PuzzleStatus.unplayed;
                        final isCurrent = puzzleIndex == state.puzzleIndex;
                        return ListTile(
                          tileColor: isCurrent
                              ? Theme.of(context).colorScheme.primaryContainer
                                    .withValues(alpha: 0.35)
                              : null,
                          leading: Icon(
                            _statusIcon(status),
                            color: _statusColor(status),
                          ),
                          title: Text('#${puzzleIndex + 1}'),
                          subtitle: Text(_statusLabel(status)),
                          trailing: isCurrent ? const Text('Aktuell') : null,
                          onTap: () {
                            bloc.jumpToPuzzle(puzzleIndex);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<int> _filteredIndices(PuzzlePlayerState state) {
    final pack = state.pack;
    if (pack == null) {
      return const <int>[];
    }
    final out = <int>[];
    for (var i = 0; i < pack.puzzles.length; i++) {
      final puzzle = pack.puzzles[i];
      final status =
          state.puzzleStatusesById[puzzle.id] ?? PuzzleStatus.unplayed;
      if (_matchesFilter(status, state.indexFilter)) {
        out.add(i);
      }
    }
    return out;
  }

  bool _matchesFilter(PuzzleStatus status, PuzzleStatusFilter filter) {
    switch (filter) {
      case PuzzleStatusFilter.all:
        return true;
      case PuzzleStatusFilter.open:
        return status == PuzzleStatus.unplayed;
      case PuzzleStatusFilter.attempted:
        return status == PuzzleStatus.attempted;
      case PuzzleStatusFilter.solved:
        return status == PuzzleStatus.solved;
    }
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }
}

class _SegmentedProgressBar extends StatelessWidget {
  const _SegmentedProgressBar({
    required this.solvedCount,
    required this.attemptedCount,
    required this.openCount,
  });

  final int solvedCount;
  final int attemptedCount;
  final int openCount;

  @override
  Widget build(BuildContext context) {
    final total = solvedCount + attemptedCount + openCount;
    if (total <= 0) {
      return const SizedBox(height: 8);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 8,
        child: Row(
          children: <Widget>[
            if (solvedCount > 0)
              Expanded(
                flex: solvedCount,
                child: const ColoredBox(color: Colors.green),
              ),
            if (attemptedCount > 0)
              Expanded(
                flex: attemptedCount,
                child: const ColoredBox(color: Colors.amber),
              ),
            if (openCount > 0)
              Expanded(
                flex: openCount,
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PuzzleStatusChip extends StatelessWidget {
  const _PuzzleStatusChip({required this.status});

  final PuzzleStatus status;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(_statusIcon(status), size: 16, color: _statusColor(status)),
      label: Text(_statusLabel(status)),
    );
  }
}

IconData _statusIcon(PuzzleStatus status) {
  switch (status) {
    case PuzzleStatus.unplayed:
      return Icons.radio_button_unchecked;
    case PuzzleStatus.attempted:
      return Icons.radio_button_checked;
    case PuzzleStatus.solved:
      return Icons.check_circle;
  }
}

Color _statusColor(PuzzleStatus status) {
  switch (status) {
    case PuzzleStatus.unplayed:
      return Colors.grey;
    case PuzzleStatus.attempted:
      return Colors.amber;
    case PuzzleStatus.solved:
      return Colors.green;
  }
}

String _statusLabel(PuzzleStatus status) {
  switch (status) {
    case PuzzleStatus.unplayed:
      return 'Offen';
    case PuzzleStatus.attempted:
      return 'Versucht';
    case PuzzleStatus.solved:
      return 'Gelöst';
  }
}

bool _isWhiteToMove(String fen) {
  final parts = fen.split(' ');
  if (parts.length < 2) {
    return true;
  }
  return parts[1] == 'w';
}
