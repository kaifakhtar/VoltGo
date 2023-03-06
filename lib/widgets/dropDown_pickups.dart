import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownPickUp extends StatelessWidget {
  const DropDownPickUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pickUpName="Night Canteen";
    return  Container(
      height: 38.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
        blurRadius: 0.1.r,
        spreadRadius: 0,
        offset: Offset(0.h,0.5.h)
      )
    ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 10.w,),
          Text(pickUpName,
            style: GoogleFonts.inter(fontSize: 14.h),),
          SizedBox(width: 75.w,),
          Icon(Icons.arrow_drop_down_outlined)
        ],
      ),
    );
  }
}
