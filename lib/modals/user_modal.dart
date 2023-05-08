// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModal {
  final String userId;
  final int code;
  final String email;
  final String mobNo;
  //final bool isRiding;
  final List<dynamic> completedRides;
  final String name;
  final String onGoingRideId;
  final int starPoints;
  UserModal({
    required this.completedRides,
    required this.userId,
    required this.code,
    required this.email,
    required this.mobNo,
    //required this.isRiding,
    required this.name,
    required this.onGoingRideId,
    required this.starPoints,
  });

  UserModal copyWith({
    // returns new object
    String? userId,
    int? code,
    String? email,
    String? mobNo,
    // bool? isRiding,
    String? name,
    String? onGoingRideId,
    List<String>? completedRides,
    int? starPoints,
  }) {
    return UserModal(
        userId: userId ?? this.userId,
        code: code ?? this.code,
        email: email ?? this.email,
        mobNo: mobNo ?? this.mobNo,
        //  isRiding: isRiding ?? this.isRiding,
        name: name ?? this.name,
        onGoingRideId: onGoingRideId ?? this.onGoingRideId,
        starPoints: starPoints ?? this.starPoints,
        completedRides: completedRides ?? this.completedRides);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'code': code,
      'email': email,
      'mobNo': mobNo,
      // 'isRiding': isRiding,
      'name': name,
      'onGoingRideId': onGoingRideId,
      'starPoints': starPoints,
      'completedRides': completedRides
    };
  }

  factory UserModal.fromMap(Map<String, dynamic>? map) {
    return UserModal(
      userId: map!['userId'] as String,
      code: map['code'] as int,
      email: map['email'] as String,
      mobNo: map['mobNo'] as String,
      name: map['name'] != null ? map['name'] as String : '',
      onGoingRideId: map['onGoingRideId'] as String,
      starPoints: map['starPoints'] as int,
      completedRides: map['completedRides'],
      //  isRiding: map['isRiding'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) =>
      UserModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModal(userId: $userId, code: $code, email: $email, mobNo: $mobNo, name: $name, onGoingRideId: $onGoingRideId, starPoints: $starPoints)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModal &&
        other.userId == userId &&
        other.code == code &&
        other.email == email &&
        other.mobNo == mobNo &&
        // other.isRiding == isRiding &&
        other.name == name &&
        other.onGoingRideId == onGoingRideId &&
        other.starPoints == starPoints;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        code.hashCode ^
        email.hashCode ^
        mobNo.hashCode ^
        // isRiding.hashCode ^
        name.hashCode ^
        onGoingRideId.hashCode ^
        starPoints.hashCode;
  }

  // factory UserModal.fromMap(Map<String, dynamic> map) {
  //   return UserModal(
  //     userId: map['userId'] ?? '',
  //     code: map['code'] ?? '',
  //     email: map['email'] ?? '',
  //     mobNo: map['mobNo'] ?? '',
  //     isRiding: map['isRiding'] ?? false,
  //     name: map['name'] ?? '',
  //     onGoingRideId: map['onGoingRideId'] ?? '',
  //     starPoints: map['starPoints']?.toInt() ?? 0,
  //   );
  // }
}
