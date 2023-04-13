import 'package:HarRidePay/modals/driver.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onlineDriverProvider = StateProvider.autoDispose<OnlineDriverProvider>(
  // We return the default sort type, here name.
  (ref) => OnlineDriverProvider(),
);

class OnlineDriverProvider {
  final List<Driver> _online_driver_list = [];

  get online_driver_list => _online_driver_list;

  void addDriver(Driver driver) {
    _online_driver_list.add(driver);
  }

  void removeAllDriver() {
    _online_driver_list.clear();
  }

  bool hasUid(uid) {
    if (_online_driver_list.contains(uid)) {
      return true;
    }
    return false;
  }
}
