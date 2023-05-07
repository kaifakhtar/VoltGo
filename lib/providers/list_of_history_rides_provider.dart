// ignore: file_names

import 'package:HarRidePay/modals/ride_modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyRidesListProvider = StateProvider<List<RideModal>>((ref) {
  return [];
});
