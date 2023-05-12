import 'package:HarRidePay/widgets/driver_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideStatusWidget extends ConsumerStatefulWidget {
  //const RideStatusWidget({super.key});
  String driverName;
  int code;
  String driverMobNno;
  String pickUP, drop;
  RideStatusWidget(
      {super.key,
      required this.driverName,
      required this.code,
      required this.driverMobNno,
      required this.pickUP,
      required this.drop});
  @override
  ConsumerState<RideStatusWidget> createState() => _RideStatusWidgetState();
}

class _RideStatusWidgetState extends ConsumerState<RideStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
      child: Container(
        height: 320.h,
        width: 340.w,
        //padding: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12.r,
                spreadRadius: 2.r,
                offset: Offset(0.h, 0.h))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Code',
                        style: GoogleFonts.poppins(fontSize: 24.sp),
                      ),
                      // Text(
                      //   widget.code.toString(),
                      //   style: GoogleFonts.poppins(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 24.sp,
                      //       color: const Color(0xff38E54D)),
                      // ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            color: const Color(0xff38E54D)),
                        child: Text(
                          widget.code.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  // const Divider(
                  //   thickness: 1,
                  // ),
                  SizedBox(
                    height: 16.h,
                  ),
                  // CircleAvatar(
                  //   child: Image.asset('asset/images/taxi.png'),
                  // ),
                  DriverCard(
                      profileImage: 'asset/images/taxi.png',
                      driverName: widget.driverName,
                      mobileNumber: widget.driverMobNno),
                  SizedBox(
                    height: 24.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pick up",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: Colors.orange),
                      ),
                      Text(
                        "Drop",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.pickUP,
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 39, 38, 36)),
                      ),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 20,
                        color: Colors.black38,
                      ),
                      Text(
                        widget.drop,
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 31, 34, 32)),
                      ),
                    ],
                  ),

                  // Divider(
                  //   thickness: 1.h,
                  // ),
                  SizedBox(
                    height: 0.h,
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: const Color(0xff4BB543).withOpacity(.3),
                //     spreadRadius: 2,
                //     blurRadius: 4,
                //     offset: const Offset(0, -3), // changes position of shadow
                //   ),
                // ],

                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(12.r),
                //     bottomRight: Radius.circular(12.r)),
                // border: Border.all(color: Colors.grey.withOpacity(.3))
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\u20B9 100.00',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          // color:
                          //     Color,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
