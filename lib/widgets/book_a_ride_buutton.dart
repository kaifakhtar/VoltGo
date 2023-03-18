import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class BookRideButton extends StatelessWidget {
  const BookRideButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 6.r,
              spreadRadius: 1,
              offset: Offset(0.h, 4.h))
        ],
        borderRadius: BorderRadius.circular(12.h),
        color: Colors.black,
      ),
      height: 50.h,
      width: 285.w,
      child: Center(child: Text("Book a ride",
        style: GoogleFonts.inter(fontSize: 16.h,color: Colors.white),)
      ),
    );
  }
}
