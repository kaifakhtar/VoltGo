import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/driver.dart';
import 'book_driver_button.dart';

class AvailableRidersTile extends StatelessWidget {
  Driver driver;

  AvailableRidersTile(this.driver);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          height: 58.h,
          width: 285.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
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
