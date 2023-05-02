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
      {required this.driverName,
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
        height: 300.h,
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
                    children: [
                      Text(
                        'Code',
                        style: GoogleFonts.poppins(fontSize: 20.sp),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            color: Colors.amber.withOpacity(.2)),
                        child: Text(
                          widget.code.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: Colors.deepOrange.shade300),
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
                    height: 16.h,
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 39, 38, 36)),
                      ),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 25,
                        color: Colors.black38,
                      ),
                      Text(
                        widget.drop,
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color:const  Color.fromARGB(255, 31, 34, 32)),
                      ),
                    ],
                  ),

                  // Divider(
                  //   thickness: 1.h,
                  // ),
                  // SizedBox(
                  //   height: 12.h,
                  // ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 220, 255, 223).withOpacity(.6),
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
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
                          fontSize: 16.sp, color: Colors.black87),
                    ),
                    Text(
                      '\u20B9 100',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: Colors.black87,
                          // color:
                          //     Color,
                          fontWeight: FontWeight.w700),
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
