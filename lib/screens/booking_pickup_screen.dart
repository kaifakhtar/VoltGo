import 'package:flutter/material.dart';

import '../widgets/booking_pickup_dest_widget.dart';

class BookingPickupScreen extends StatelessWidget {
  const BookingPickupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: BookingPickDestWidget(),
      ),
    );
  }
}
