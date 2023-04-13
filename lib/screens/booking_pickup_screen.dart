import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/booking_pickup_dest_widget.dart';
import '../widgets/driverTilesContainwer.dart';
import 'login_screen.dart';

class BookingPickupScreen extends StatefulWidget {
  const BookingPickupScreen({Key? key}) : super(key: key);

  @override
  State<BookingPickupScreen> createState() => _BookingPickupScreenState();
}

class _BookingPickupScreenState extends State<BookingPickupScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title:
            Text("HarRidePay", style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1.h,
        actions: [
          IconButton(
              onPressed: () {
                _signOut();
                // Navigator.(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
               Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()),
                      );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Color(0xffeeeeee),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            BookingPickDestWidget(),
            SizedBox(
              height: 20.h,
            ),
            DriverTilesContainer()
          ],
        ),
      ),
    );
  }
}
