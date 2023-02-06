import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CarTileSelected extends StatelessWidget {
  const CarTileSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var batteryLevel=7;
    return Container(
      width: 312.w,
      // height: 80.h,
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Color(0xffF1FFEB),
        borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Car name",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp, color: Colors.black.withOpacity(.5)),
                ),
                SizedBox(height: 8.h),
                Text("Alpha",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp, fontWeight: FontWeight.w500))
              ],
            ),
            Column(
              children: [
                Text(
                  "Battery level",
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp, color: Colors.black.withOpacity(.5)),
                ),
                SizedBox(height: 8.h),
                Text(
                  "${batteryLevel}%",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color:batteryLevel>50?Color(0xff51CB20):Colors.orange
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
