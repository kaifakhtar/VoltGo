class Ride {
  String? uid;
  String? driverName;
  String? passengerName;

  // Add more attributes as needed

  Ride({required this.driverName, required this.passengerName});

  // Convert Ride object to a map
  Map<String, dynamic> toMap() {
    return {
      'driverName': driverName,
      'passengerName': passengerName,
      // Map other attributes to their corresponding field names
    };
  }
}
