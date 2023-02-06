import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../widgets/payment_confirm_bottom_sheet.dart';

class Journey extends StatefulWidget {
  const Journey({Key? key}) : super(key: key);

  @override
  State<Journey> createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 200.h,),
            Column(
              children: [
                // Container(
                //   child:
                //       Lottie.asset('animations/travel_animation.json', height: 400.h),
                // ),
                Text(
                  "On the journey",
                  style: GoogleFonts.poppins(fontSize: 32.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "sit back and relax",
                  style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(.50)),
                ),

              ],
            ),
            Container(
              child:
              Lottie.asset('animations/car_loading.json', height: 200.h),
            ),
            Container(
              height: 44.h,
              decoration: BoxDecoration(
                  color: Color(0xffF1FFED),
                  boxShadow: [BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 2.h,
                      offset: Offset(0,-2.h)
                  )]
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text("Reached your destination?",
                      style: TextStyle(fontSize: 12.sp),),
                      OutlinedButton(onPressed: (){
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder( // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            context: context, builder: (context)=>PaymentConfirmBottomSheet()
                        );
                      },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),),
                          child: Text("Yes",
                            style: TextStyle(fontSize: 12.sp,color: Colors.black),),

                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
