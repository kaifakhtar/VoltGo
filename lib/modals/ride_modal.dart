import 'dart:convert';

class RideModal {
  String uid;
  int code;
  String driverMobNo;
  String driverID;
  String driverName;
  String startPoint;
  String endPoint;
  String passengerName;
  String passengerID;
  String passengerMobNO;
  String rideDateTime;
  RideModal({
    required this.uid,
    required this.code,
    required this.driverMobNo,
    required this.driverID,
    required this.driverName,
    required this.startPoint,
    required this.endPoint,
    required this.passengerName,
    required this.passengerID,
    required this.passengerMobNO,
    required this.rideDateTime
  });

  RideModal copyWith({
    String? uid,
    int? code,
    String? driverMobNo,
    String? driverID,
    String? driverName,
    String? startPoint,
    String? endPoint,
    String? passengerName,
    String? passengerID,
    String? passengerMobNO,
    String? rideDateTime
  }) {
    return RideModal(
      uid: uid ?? this.uid,
      code: code ?? this.code,
      driverMobNo: driverMobNo ?? this.driverMobNo,
      driverID: driverID ?? this.driverID,
      driverName: driverName ?? this.driverName,
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      passengerName: passengerName ?? this.passengerName,
      passengerID: passengerID ?? this.passengerID,
      passengerMobNO: passengerMobNO ?? this.passengerMobNO,
      rideDateTime: rideDateTime ?? this.rideDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'code': code,
      'driverMobNo': driverMobNo,
      'driverID': driverID,
      'driverName': driverName,
      'startPoint': startPoint,
      'endPoint': endPoint,
      'passengerName': passengerName,
      'passengerID': passengerID,
      'passengerMobNO': passengerMobNO,
      'rideDateTime' : rideDateTime
    };
  }

  factory RideModal.fromMap(Map<String, dynamic> map) {
    return RideModal(
      uid: map['uid'] ?? '',
      code: map['code']?.toInt() ?? 0,
      driverMobNo: map['driverMobNo'] ?? '',
      driverID: map['driverID'] ?? '',
      driverName: map['driverName'] ?? '',
      startPoint: map['startPoint'] ?? '',
      endPoint: map['endPoint'] ?? '',
      passengerName: map['passengerName'] ?? '',
      passengerID: map['passengerID'] ?? '',
      passengerMobNO: map['passengerMobNO'] ?? '',
      rideDateTime: map['rideDateTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RideModal.fromJson(String source) =>
      RideModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RideModal(uid: $uid, code: $code, driverMobNo: $driverMobNo, driverID: $driverID, driverName: $driverName, startPoint: $startPoint, endPoint: $endPoint, passengerName: $passengerName, passengerID: $passengerID, passengerMobNO: $passengerMobNO)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RideModal &&
        other.uid == uid &&
        other.code == code &&
        other.driverMobNo == driverMobNo &&
        other.driverID == driverID &&
        other.driverName == driverName &&
        other.startPoint == startPoint &&
        other.endPoint == endPoint &&
        other.passengerName == passengerName &&
        other.passengerID == passengerID &&
        other.passengerMobNO == passengerMobNO &&
        other.rideDateTime==rideDateTime;
    
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        code.hashCode ^
        driverMobNo.hashCode ^
        driverID.hashCode ^
        driverName.hashCode ^
        startPoint.hashCode ^
        endPoint.hashCode ^
        passengerName.hashCode ^
        passengerID.hashCode ^
        passengerMobNO.hashCode ^
        rideDateTime.hashCode;
  }
}
