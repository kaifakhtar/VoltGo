// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModal {
  final String code;
  final String email;
  final String mobNo;
  final String name;
  final String onGoingRideId;
  final int starPoints;
  UserModal({
    required this.code,
    required this.email,
    required this.mobNo,
    required this.name,
    required this.onGoingRideId,
    required this.starPoints,
  });

  UserModal copyWith({
    String? code,
    String? email,
    String? mobNo,
    String? name,
    String? onGoingRideId,
    int? starPoints,
  }) {
    return UserModal(
      code: code ?? this.code,
      email: email ?? this.email,
      mobNo: mobNo ?? this.mobNo,
      name: name ?? this.name,
      onGoingRideId: onGoingRideId ?? this.onGoingRideId,
      starPoints: starPoints ?? this.starPoints,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'email': email,
      'mob no': mobNo,
      'name': name,
      'on going ride id': onGoingRideId,
      'starPoints': starPoints,
    };
  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      code: map['code'] as String,
      email: map['email'] as String,
      mobNo: map['mob no'] as String,
      name: map['name'] as String,
      onGoingRideId: map['on going ride id'] as String,
      starPoints: map['starPoints'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) => UserModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModal(code: $code, email: $email, mobNo: $mobNo, name: $name, onGoingRideId: $onGoingRideId, starPoints: $starPoints)';
  }

  @override
  bool operator ==(covariant UserModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.email == email &&
      other.mobNo == mobNo &&
      other.name == name &&
      other.onGoingRideId == onGoingRideId &&
      other.starPoints == starPoints;
  }

  @override
  int get hashCode {
    return code.hashCode ^
      email.hashCode ^
      mobNo.hashCode ^
      name.hashCode ^
      onGoingRideId.hashCode ^
      starPoints.hashCode;
  }
}
