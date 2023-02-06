import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentConfirmBottomSheet extends StatelessWidget {
  const PaymentConfirmBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.h)),
      ),
      height: 231.h,
      child: Column(
        children: [
          SizedBox(
            height:12.h
          ),
          Container(
            height: 5.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: Colors.grey,
                borderRadius: BorderRadius.circular(100)
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "Proceed for payment?",
            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: 267.w,
            height: 44.h,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(88.0),
                  ),
                ),
                child: Text("Yes",
                style: GoogleFonts.poppins(),)),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: 267.w,
            height: 44.h,
            child: ElevatedButton(
                onPressed: ()=> Navigator.pop(context),

                style: ElevatedButton.styleFrom(
                  primary: Color(0xffEEEEEE),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(88.0),
                  ),
                ),
                child: Text(
                  "Wait, journey not over yet",
                  style: GoogleFonts.poppins(color: Colors.black),
                )),
          )
        ],
      ),
    );
    ;
  }
}
