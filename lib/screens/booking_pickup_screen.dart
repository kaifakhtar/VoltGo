import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/booking_pickup_dest_widget.dart';

class BookingPickupScreen extends StatelessWidget {
  const BookingPickupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: SafeArea(child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:80.h),
              BookingPickDestWidget(),
            ],
          ),
        )),
      ),
    );
  }
}
