import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';

class BookedScreen extends StatefulWidget {
  const BookedScreen({Key? key}) : super(key: key);

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Text("We have booked Ride",
          style: TextStyle(fontSize: 24.sp),)
        ),
      ),
    );
  }
}
