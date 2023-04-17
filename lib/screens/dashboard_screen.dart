import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'booking_pickup_screen.dart';
import 'ride_status_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentIndex = 0;
  final pages = [const BookingPickupScreen(), const RideStatusPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        elevation: 1.h,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Dashboard",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      ),
      body: IndexedStack(children: pages,index: currentIndex,) ,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(.5),
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_rental), label: "Ride status")
          ]),
    );
  }
}
