import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../screens/onthejourney_screen.dart';

class CarTile extends StatefulWidget {
  const CarTile({Key? key}) : super(key: key);

  @override
  State<CarTile> createState() => _CarTileState();
}

class _CarTileState extends State<CarTile> {
  @override
  Widget build(BuildContext context) {
    var batteryLevel=7;
    bool isSelected=false;
    return InkWell(
      onTap:()=> Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Journey()),
      ),
      child: Container(
        width: 312.w,
       // height: 80.h,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: isSelected?Color(0xffF1FFEB):Colors.white,
          borderRadius: BorderRadius.circular(20),
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
                    style: TextStyle(
                        fontSize: 10.sp, color: Colors.black.withOpacity(.5)),
                  ),
                  SizedBox(height: 8.h),
                  Text("Alpha",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500))
                ],
              ),
              Column(
                children: [
                  Text(
                    "Battery level",
                    style: TextStyle(
                        fontSize: 10.sp, color: Colors.black.withOpacity(.5)),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "${batteryLevel}%",
                    style: TextStyle(
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
      ),
    );
  }
}
