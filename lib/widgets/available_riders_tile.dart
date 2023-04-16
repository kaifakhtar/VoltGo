import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/driver.dart';
import '../screens/driver_booked_screen.dart';
import 'book_driver_button.dart';

class AvailableRidersTile extends ConsumerWidget {
  Driver driver;

  AvailableRidersTile(this.driver);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 85, 85, 85).withOpacity(0.2),
                  blurRadius: 8.r,
                  spreadRadius: 1.r,
                  offset: Offset(0.h, 0.h))
            ],
            borderRadius: BorderRadius.circular(12.r),
          ),
          height: 72.h,
          width: 285.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  driver.name,
                  style: GoogleFonts.poppins(fontSize: 14.sp),
                ),
                BookDriverButton(driver)
              ],
            ),
          )),
    );
  }
}
