import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled5/widgets/car_tile_selected.dart';

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
      backgroundColor: const Color(0xffEEEEEE),
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
                child: Padding(
                  padding:  EdgeInsets.only(top: 20.h),
                  child: Column(
                    children: [
                      Image.asset('asset/images/car_image.png',
                      height: 120.h,
                      width: 120.w,),
                       const SizedBox(height: 16,),
                       Text("Cars Available",
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.sp,),
                      Text("Select a car",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          //fontWeight: FontWeight.w200,
                          color: Colors.black.withOpacity(.4)
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return const CarTile();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
