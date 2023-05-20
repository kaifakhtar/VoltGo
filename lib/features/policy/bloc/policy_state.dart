// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'policy_bloc.dart';

@immutable
abstract class PolicyState {}

class PolicyInitial extends PolicyState {}

class PolicyLoading extends PolicyState {}

class PolicyLoaded extends PolicyState {
  final String policy;
  PolicyLoaded({
    required this.policy,
  });

  
}

class PolicyError extends PolicyState {
  final String errorMessage;
  PolicyError({
    required this.errorMessage,
  });
}
