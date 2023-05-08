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
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8.r,
                  spreadRadius: 2.r,
                  offset: Offset(0.h, 0))
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('asset/images/taxi.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            driver.name,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Dedicated driver",
                            style: GoogleFonts.poppins(
                                fontSize: 11.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BookDriverButton(driver)
              ],
            ),
          ),
        ));
  }
}
