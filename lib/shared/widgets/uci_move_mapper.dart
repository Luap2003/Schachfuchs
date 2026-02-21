class UciMoveMapper {
  const UciMoveMapper._();

  static String? fromVerboseHistoryEntry(Map<String, dynamic>? entry) {
    if (entry == null) {
      return null;
    }

    final from = entry['from'] as String?;
    final to = entry['to'] as String?;
    if (from == null || to == null || from.length != 2 || to.length != 2) {
      return null;
    }

    final san = entry['san'] as String?;
    final promotion = _promotionFromSan(san);
    return '$from$to${promotion ?? ''}';
  }

  static String? _promotionFromSan(String? san) {
    if (san == null) {
      return null;
    }

    final match = RegExp(r'=[QRBN]').firstMatch(san.toUpperCase());
    if (match == null) {
      return null;
    }

    final promoted = match.group(0)!.replaceFirst('=', '');
    return promoted.toLowerCase();
  }
}
