import 'package:HarRidePay/modals/ride_modal.dart';
import 'package:HarRidePay/providers/firebase_providers.dart';
import 'package:HarRidePay/providers/list_of_history_Rides_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyUserRepositoryProvider = Provider<HistoryUserRepository>((ref) {
  return HistoryUserRepository(firestore: ref.read(fireStoreProvider));
});

class HistoryUserRepository {
  final FirebaseFirestore _firestore;
  final List<dynamic> completedRidesIDsList = [];

  HistoryUserRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<List> getArrayFromDocument(
      String documentId, String collectionName) async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection(collectionName).doc(documentId).get();
    final List<dynamic> completedRidesIDsList =
        snapshot.data()?['completedRides'];
    print("completed ride list is $completedRidesIDsList");
    return completedRidesIDsList;
  }

  Future<void> searchForDocuments(WidgetRef ref,
      List<dynamic> completedRidesIDsList, String collectionName) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection(collectionName)
            .where(FieldPath.documentId, whereIn: completedRidesIDsList)
            .get();
    final List<RideModal> listOfHistoryRides = [];

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      listOfHistoryRides.add(RideModal.fromMap(querySnapshot.docs[i].data()));
    }
    ref.read(historyRidesListProvider.notifier).state = listOfHistoryRides;
    // return newArray;
    print(listOfHistoryRides);
  }
}
