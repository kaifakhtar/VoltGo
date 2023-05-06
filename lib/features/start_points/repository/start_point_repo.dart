import 'package:HarRidePay/providers/firebase_providers.dart';
import 'package:HarRidePay/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final starPointRepoProvider = Provider<StarPointRepo>((ref) {
  return StarPointRepo(ref.read(fireStoreProvider));
});

class StarPointRepo {
  final FirebaseFirestore _firestore;

  StarPointRepo(this._firestore);

  incrementStarPoint(
    ref,
    String collecName,
    String docId,
  ) async {
    final prev = ref.read(userModalProvider.notifier).state!.starPoints;
    ref.read(userModalProvider.notifier).state = ref
        .read(userModalProvider.notifier)
        .state!
        .copyWith(
            starPoints: prev +
                1); //new object will be created with new value of starpoint

    await _firestore.collection(collecName).doc(docId).update(ref
        .read(userModalProvider)!
        .toMap()); // convert to map then store to firebase
  }
}
