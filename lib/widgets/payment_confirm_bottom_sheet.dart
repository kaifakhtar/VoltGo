import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            height: 24.h,
          ),
          Text(
            "Proceed for payment?",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 32.h,
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
                child: Text("Yes")),
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
                  primary: Color(0xffEEEEEE),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(88.0),
                  ),
                ),
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
    ;
  }
}
