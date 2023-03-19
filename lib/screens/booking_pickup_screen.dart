import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/booking_pickup_dest_widget.dart';

class BookingPickupScreen extends StatefulWidget {
  const BookingPickupScreen({Key? key}) : super(key: key);

  @override
  State<BookingPickupScreen> createState() => _BookingPickupScreenState();
}

class _BookingPickupScreenState extends State<BookingPickupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:80.h),
              BookingPickDestWidget(),
            ],
          ),
        ),
    );
  }
}
