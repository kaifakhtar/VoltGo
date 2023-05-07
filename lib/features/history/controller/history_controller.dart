import 'package:HarRidePay/features/history/repository/history_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyControllerProvider = Provider<HistoryController>((ref) {
  return HistoryController(
      historyUserRepository: ref.read(historyUserRepositoryProvider));
});

class HistoryController {
  final HistoryUserRepository _historyUserRepository;

  HistoryController({required HistoryUserRepository historyUserRepository})
      : _historyUserRepository = historyUserRepository;

  Future<List> getArrayFromDocument(
      String documentId, String collectionName) async {
    return _historyUserRepository.getArrayFromDocument(
        documentId, collectionName);
  }

  Future<void> searchForDocuments(
      ref, List<dynamic> completedRidesIDsList, String collectionName) async {
    _historyUserRepository.searchForDocuments(
        ref, completedRidesIDsList, collectionName);
  }
}
