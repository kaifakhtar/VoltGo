import 'dart:math';

import 'package:HarRidePay/modals/driver.dart';
import 'package:HarRidePay/providers/online_driver_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverBookedScreen extends ConsumerWidget {
  //const DriverBookedScreen({super.key});

  // var driverName = '';
  // var driverMob = '';
  // int index;
  Driver driver;
  DriverBookedScreen(this.driver);
  var rng = new Random();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var code = rng.nextInt(9000) + 1000;
    // Driver driver = ref.watch(onlineDriverProvider).online_driver_list[index];

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
            color: Color(0xff80ED6E),
          ),
          SizedBox(
            height: 44.h,
          ),
          Column(
            children: [
              Text(
                "Name",
                style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                driver.name,
                style: GoogleFonts.poppins(
                    fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 28.h,
              ),
              Text(
                "Contact number",
                style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "+91 ${driver.mobile}",
                style: GoogleFonts.poppins(
                    fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                "Driver code",
                style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "$code",
                style: GoogleFonts.poppins(
                    fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      )),
    );
  }
}
