import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/on_going_ride_id_provider.dart';
import 'booking_pickup_screen.dart';
import 'login_screen.dart';
import 'ride_status_screen.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getOnGoingRideDataFromUserDB();
    super.initState();
  }

  getOnGoingRideDataFromUserDB() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    final result = await FirebaseFirestore.instance
        .collection('users registered')
        .doc(userId)
        .get();
    Map<String, dynamic> dataMap = result.data() as Map<String, dynamic>;

    if (dataMap.containsKey('on going ride id')) {
      // <-- You need to use the dataMap
      print("on going ride exist!");
      ref.read(onGoingIDprovider.notifier).state = dataMap['on going ride id'];
      print("on going ride exist! id ${ref.read(onGoingIDprovider)} ");
    } else {
      //not exists
      print("on going ride not exist!");
    }
    // final List<DocumentSnapshot> documents = result.docs;

    // if (documents.length > 0) {
    //   print("on going ride exist!");
    // } else {
    //   //not exists
    //   print("on going ride not exist!");
    // }
    //final data=  documentSnapshot.;
  }

  int currentIndex = 0;
  final pages = [const BookingPickupScreen(), const RideStatusPage()];

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 27, 27, 27),
              ),
              onPressed: () {
                _signOut();
                // Navigator.(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()),
                );
              }),
        ],
        elevation: 1.h,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Dashboard",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      ),
      body: IndexedStack(
        children: pages,
        index: currentIndex,
      ),
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
