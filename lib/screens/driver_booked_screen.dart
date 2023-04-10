import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverBookedScreen extends StatelessWidget {
  //const DriverBookedScreen({super.key});

  var driverName = '';
   var driverMob = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 64.h,
          ),
          Image.asset(
            'asset/images/green_tick.png',
            height: 110.h,
            width: 110.w,
          ),
          SizedBox(
            height: 28.h,
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Yeh! Driver booked.",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
            ),
            color: const Color(0xffE4FFDA),
          ),
          Text(
                "Name",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                driverName,
                style: GoogleFonts.poppins(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
        ],
      )),
    );
  }
}
