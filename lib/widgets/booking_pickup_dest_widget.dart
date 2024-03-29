import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_for_ride_button.dart';
import 'dropDown_pickups.dart';

class BookingPickDestWidget extends StatefulWidget {
  const BookingPickDestWidget({Key? key}) : super(key: key);

  @override
  State<BookingPickDestWidget> createState() => _BookingPickDestWidgetState();
}

class _BookingPickDestWidgetState extends State<BookingPickDestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12.r,
              spreadRadius: 1.r,
              offset: Offset(0.h, 0.h))
        ],
        color: Colors.white,
      ),
      height: 200.h,
      width: 331.w,
      // margin: EdgeInsets.fromLTRB(14.w, 54.h, 14.h, 517.h),
      child: Column(
        //add padding here
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 70.w),
            child: Text(
              "Pickup",
              style: GoogleFonts.poppins(
                  fontSize: 12.h,
                  color: Colors.black.withOpacity(0.80),
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 24.w,
              ),
              const Icon(
                Icons.circle,
                color: Colors.orangeAccent,
              ),
              SizedBox(
                width: 24.w,
              ),
              DropDownPickUp("Hostle 7 & 7E", true),
              // SizedBox(width: 20.w,),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 70.w),
            child: Text(
              "Drop",
              style: GoogleFonts.poppins(
                  fontSize: 12.h,
                  color: Colors.black.withOpacity(0.80),
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 24.w,
              ),
              const Icon(
                Icons.circle,
                color: Colors.green,
              ),
              SizedBox(
                width: 24.w,
              ),
              DropDownPickUp("Snackers", false),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
          // SizedBox(
          //   height: 48.h,
          // ),
          //const Center(child: SearchForRidesButton()),
          // SizedBox(height: 20.h,)
        ],
      ),
    );
  }
}
