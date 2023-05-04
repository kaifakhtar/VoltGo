// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:HarRidePay/features/auth/auth_service.dart';
import 'package:HarRidePay/modals/user_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateChangeProvider = StreamProvider((ref) {
  return ref.read(authControllerProvider).onAuthStateChange;
});
final getUserDataStreamProvider = StreamProvider.family((ref,uid) {
  return ref.read(authControllerProvider).getUserdata(uid);
});

final authControllerProvider = Provider((ref) {
  return AuthController(authRepository: ref.read(authRepositoryProvider));
});

class AuthController {
  final AuthRepository _authRepository;
  AuthController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Stream<User?> get onAuthStateChange => _authRepository.onAuthStateChange;

  Stream<UserModal> getUserdata(uid) {
    return _authRepository.getUserdata(uid);
  }
}
