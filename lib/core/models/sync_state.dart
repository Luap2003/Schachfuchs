enum SyncState { localOnly, pendingSync, synced, conflict }

extension SyncStateX on SyncState {
  String get dbValue {
    switch (this) {
      case SyncState.localOnly:
        return 'local_only';
      case SyncState.pendingSync:
        return 'pending_sync';
      case SyncState.synced:
        return 'synced';
      case SyncState.conflict:
        return 'conflict';
    }
  }

  static SyncState fromDbValue(String value) {
    return switch (value) {
      'local_only' => SyncState.localOnly,
      'pending_sync' => SyncState.pendingSync,
      'synced' => SyncState.synced,
      'conflict' => SyncState.conflict,
      _ => SyncState.localOnly,
    };
  }
}
