import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownPickUp extends StatelessWidget {
 String locationName="Hostle 7";
  DropDownPickUp(this.locationName);

  @override
  Widget build(BuildContext context) {
    //String pickUpName="Night Canteen";
    return  Container(
      height: 38.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
        blurRadius: 3.r,
        spreadRadius: 0.r,
        offset: Offset(0.h,2.h)
      )
    ],
        color: Colors.white,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(width: 10.w,),
            Text(locationName,
              style: GoogleFonts.inter(fontSize: 14.h),),
            SizedBox(width: 75.w,),
            Icon(Icons.arrow_drop_down_outlined)
          ],
        ),
      ),
    );
  }
}
