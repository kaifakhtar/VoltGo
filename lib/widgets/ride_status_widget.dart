import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideStatusWidget extends StatefulWidget {
  const RideStatusWidget({super.key});

  @override
  State<RideStatusWidget> createState() => _RideStatusWidgetState();
}

class _RideStatusWidgetState extends State<RideStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 211.h,
      width: 340.w,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h), color: Colors.green),
      child: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: TextStyle(fontSize: 16.sp),
              ),
              Container(
                child: Text(
                  'On going',
                  style: TextStyle(fontSize: 16.sp),
                ),
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    color: Colors.pink),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chandan Rolex',
                style: TextStyle(fontSize: 16.sp),
              ),
              Text(
                '1234567890',
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Chandan Rolex',
          //       style: TextStyle(fontSize: 16.sp),
          //     ),
          //     Text(
          //       '1234567890',
          //       style: TextStyle(fontSize: 16.sp),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pickup',
                style: TextStyle(
                    fontSize: 12.sp, color: Colors.black.withOpacity(0.5)),
              ),
              Text(
                'Drop',
                style: TextStyle(
                    fontSize: 12.sp, color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Night Canteen',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                'Hostel 17',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'time and date',
                style: TextStyle(
                    fontSize: 12.sp, color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Rs.100',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
