// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:HarRidePay/modals/user_modal.dart';
import 'package:HarRidePay/providers/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(auth: ref.read(firebaseAuthProvider),firestore: ref.read(fireStoreProvider));
});

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthRepository(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;



  Stream<User?> get onAuthStateChange => _auth.authStateChanges();

  Stream<UserModal> getUserdata(uid) {
    final collectionReference = _firestore.collection('users registered');
    return collectionReference.doc(uid).snapshots().map(
        (event) => UserModal.fromMap(event.data() as Map < String, dynamic>?));
  }
}
