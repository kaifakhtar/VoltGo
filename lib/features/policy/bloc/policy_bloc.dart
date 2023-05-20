import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  PolicyBloc() : super(PolicyInitial()) {
    on<PolicyFetchEvent>(fetchPolicy);
  }

  FutureOr<void> fetchPolicy(
      PolicyFetchEvent event, Emitter<PolicyState> emit) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    emit(PolicyLoading());
    try {
      DocumentSnapshot snapshot = await firestore
          .collection('policy')
          .doc('wuBXV7EVchSj4XPDHY6N')
          .get();
      if (snapshot.exists) {
        String policy = snapshot.get('policy') ?? '';

        print('Policy: $policy');
        emit(PolicyLoaded(policy: policy));

        // Do something with the policy string here
      } else {
        print('Document does not exist.');
        emit(PolicyError(errorMessage: "Document does not exist."));
      }
    } catch (error) {
      print('Error fetching policy: $error');
      emit(PolicyError(errorMessage: error.toString()));
    }
  }
}
