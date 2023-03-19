import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/booking_pickup_dest_widget.dart';
import '../widgets/driverTilesContainwer.dart';

class BookingPickupScreen extends StatefulWidget {
  const BookingPickupScreen({Key? key}) : super(key: key);

  @override
  State<BookingPickupScreen> createState() => _BookingPickupScreenState();
}

class _BookingPickupScreenState extends State<BookingPickupScreen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gurdas Pal",style: GoogleFonts.poppins(color: Colors.black)),
      backgroundColor: Colors.white,elevation: 1.h,),
        backgroundColor: Color(0xffeeeeee),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:20.h),
              BookingPickDestWidget(),
              SizedBox(height: 20.h,),
              DriverTilesContainer()
            ],
          ),
        ),
    );
  }
}
