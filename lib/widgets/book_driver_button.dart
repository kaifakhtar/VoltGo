import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/driver.dart';
import '../screens/driver_booked_screen.dart';

class BookDriverButton extends StatelessWidget {
  //const BookDriverButton({Key? key}) : super(key: key);
  Driver driver;
  BookDriverButton(this.driver);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => DriverBookedScreen(driver)),
        );
      },
      child: Container(
        height: 38.h,
        width: 72.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 3.r,
                spreadRadius: 0.r,
                offset: Offset(0.h, 2.h))
          ],
          borderRadius: BorderRadius.circular(8.r),
          color: Color(0xff80ED6E),
        ),
        child: Center(
          child: Text(
            "Book",
            style: GoogleFonts.poppins(fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
