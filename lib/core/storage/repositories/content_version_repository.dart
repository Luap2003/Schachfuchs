abstract class ContentVersionRepository {
  Future<void> upsertVersion({
    required String contentId,
    required String contentType,
    required int version,
  });

  Future<int?> getVersion(String contentId);
}
