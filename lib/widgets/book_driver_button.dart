import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/driver_booked_screen.dart';

class BookDriverButton extends StatelessWidget {
  const BookDriverButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DriverBookedScreen()));
      } ,
      child: Container(
        height: 38.h,
        width: 72.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Color(0xff84AB81),
    
        ),
        child: Center(
          child: Text("Book",
                style: GoogleFonts.poppins(fontSize: 12.sp),
              ),
        ),
      ),
    );
  }
}
