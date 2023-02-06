import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/car_tile.dart';

class CarSelectScreen extends StatefulWidget {
  const CarSelectScreen({Key? key}) : super(key: key);

  @override
  State<CarSelectScreen> createState() => _CarSelectScreenState();
}

class _CarSelectScreenState extends State<CarSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Container(
                height: 229.h,
                width: 312.w,
                margin: EdgeInsets.only(top: 138.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16.r))),
              ),
              SizedBox(height: 40.h,),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,i){
                      return CarTile();
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
