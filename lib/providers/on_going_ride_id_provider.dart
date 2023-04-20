import 'package:flutter_riverpod/flutter_riverpod.dart';

final onGoingIDprovider =StateProvider.autoDispose(
  // We return the default sort type, here name.
(ref) => '',
);