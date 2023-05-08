import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RideHistoryScreen extends ConsumerWidget {
  const RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Ride history"),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "We're working hard to bring you this feature!",
            style: GoogleFonts.poppins(fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
