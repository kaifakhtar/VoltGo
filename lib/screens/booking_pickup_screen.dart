import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/carousel/views/widgets/carousel_card.dart';
import '../widgets/booking_pickup_dest_widget.dart';
import '../widgets/driverTilesContainwer.dart';
import 'login_screen.dart';
import 'signUp_screen.dart';

final badgeCountProvider = StateProvider((ref) => 0);

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
      // appBar: AppBar(
      //   leading: IconButton(
      //     color: Color.fromARGB(255, 0, 0, 0),
      //     icon: Icon(Icons.menu),
      //     onPressed: () {},
      //   ),
      //   title: Text("HarRidePay",
      //       style: GoogleFonts.poppins(color: Color.fromARGB(255, 0, 0, 0))),
      //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //   elevation: 1.h,
      // actions: [
      //   IconButton(
      //       onPressed: () {
      //         _signOut();
      //         // Navigator.(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
      //         Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(
      //               builder: (BuildContext context) => LoginScreen()),
      //         );
      //       },
      // icon: Icon(
      //   Icons.logout,
      //   color: Color.fromARGB(255, 27, 27, 27),
      // ))
      //   ],
      // ),S
      // backgroundColor: Colors.grey[100],
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 12.h),
                CardBanner(),
                SizedBox(height: 32.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pickup & Drop",
                      style: GoogleFonts.notoSans(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const BookingPickDestWidget(),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "Rides available",
                      style: GoogleFonts.notoSans(
                          fontSize: 24.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const DriverTilesContainer(),
                    SizedBox(
                      height: 32.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
