import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/booking_pickup_dest_widget.dart';
import '../widgets/driverTilesContainwer.dart';
import 'login_screen.dart';
import 'signUp_screen.dart';

class BookingPickupScreen extends ConsumerStatefulWidget {
  const BookingPickupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BookingPickupScreen> createState() =>
      _BookingPickupScreenState();
}

class _BookingPickupScreenState extends ConsumerState<BookingPickupScreen> {
  var uid = '';
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void getUid() async {
    var auth = await FirebaseAuth.instance;
    final user = auth.currentUser;
    uid = user!.uid;
    print("user uid is $uid");
    if (uid != null) {
      ref.watch(userIdProvider.notifier).state = uid;
    }
  }

  @override
  void initState() {
    super.initState();
    getUid();
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
