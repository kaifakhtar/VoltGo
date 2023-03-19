import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'available_riders_tile.dart';

class DriverTilesContainer extends StatefulWidget {
  const DriverTilesContainer({Key? key}) : super(key: key);

  @override
  State<DriverTilesContainer> createState() => _DriverTilesContainerState();
}

class _DriverTilesContainerState extends State<DriverTilesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,),
      child: Column(
        children: [
          SizedBox(height: 27.h,),

          Row(
            children: [SizedBox(width: 24.h,),
            Text("Rides available",style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w700),)
          ],),
          SizedBox(height: 23.h,),
          AvailableRidersTile("Ramesh kumar","1234567899"),
          SizedBox(height: 8.h,),
          AvailableRidersTile("Tuas kumar","1234567899"),
          SizedBox(height: 8.h,),
          AvailableRidersTile("qwrr kumar","1234567899"),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
