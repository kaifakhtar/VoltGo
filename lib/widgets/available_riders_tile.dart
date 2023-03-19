import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'book_driver_button.dart';

class AvailableRidersTile extends StatelessWidget {
  String driverName;
  String driverMobNo;

  AvailableRidersTile(this.driverName, this.driverMobNo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.h),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.10)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: 58.h,
          width: 285.w,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(driverName),
                BookDriverButton()],
      ),
          )),
    );
  }
}
