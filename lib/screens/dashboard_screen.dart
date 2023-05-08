import 'package:HarRidePay/features/history/controller/history_controller.dart';
import 'package:HarRidePay/features/history/view/screen/ride_history_screen.dart';
import 'package:HarRidePay/features/start_points/controllers.dart/star_points_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:badges/badges.dart' as badges;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/on_going_ride_id_provider.dart';
import 'booking_pickup_screen.dart';
import 'login_screen.dart';
import 'ride_status_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  //To open drawer

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // void _openDrawer() {
  //   _scaffoldKey.currentState!.openDrawer();
  // }

  getOnGoingRideDataFromUserDB() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    print("user id in method $userId");
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
      print("user id in else $userId");
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
    ref.watch(userModalProvider.notifier).state = null;
  }

  void incrementStartPoint(
      // increments starpoints by calling to controller (UI -> controller -> Repo -> firebase)
      String collecName,
      String docId) {
    ref.read(starPointControllerProvider).incrementStarPointControllermethod(
        ref, collecName, docId); // calls controller method to increment
  }

  Future<List<dynamic>> getArrayFromDocument(
      String documentId, String collectionName) async {
    return ref
        .read(historyControllerProvider)
        .getArrayFromDocument(documentId, collectionName);
  }

  void searchForRidesDataFromIds(
      List completedRidesIDsList, String collectionName) {
    ref
        .read(historyControllerProvider)
        .searchForDocuments(ref, completedRidesIDsList, collectionName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        //automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
                // color: Color.fromARGB(255, 27, 27, 27),
              ),
              onPressed: () {
                _signOut();
                // Navigator.(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()),
                );
              }),
          // IconButton(
          //     onPressed: () async {
          //       incrementStartPoint(
          //           "users registered", ref.watch(userModalProvider)!.userId);
          //       final listofRideIDS = getArrayFromDocument(
          //               ref.watch(userModalProvider)!.userId,
          //               'users registered')
          //           .then((value) {
          //         searchForRidesDataFromIds(value, 'TotalRides');
          //       });
          //     },
          //     icon: const Icon(
          //       Icons.add,
          //       //color: Colors.black,
          //     ))
        ],
        elevation: 1.h,
        // leading: IconButton(
        //   onPressed: _openDrawer,
        //   icon: const Icon(Icons.menu),
        //   color: Colors.black,
        // ),
        backgroundColor: Colors.white,
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.sp),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi ${ref.watch(userModalProvider)?.name ?? "No name"}!",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 32.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    ref.watch(userModalProvider)?.mobNo ?? "No mobile no.",
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    ref.watch(userModalProvider)?.email ?? "No email",
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.star,
              ),
              title: Text(
                  'Star points ${ref.watch(userModalProvider)?.starPoints ?? "0"}'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.star_rate,
            //     color: Color(0xffffd700),
            //   ),
            //   title: const Text('Become a premium member'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RideHistoryScreen()),
                );
              },
              leading: const Icon(Icons.car_rental),
              title: Text(
                'Ride history',
                style: GoogleFonts.poppins(),
              ),
              trailing: const Icon(Icons.arrow_right_alt_rounded),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(.6),
          onTap: (value) {
            setState(() {
              currentIndex = value;
              if (value == 1) {
                ref.watch(badgeCountProvider.notifier).state = 0;
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 24.h,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: badges.Badge(
                    badgeContent: const Text(
                      '1',
                    ),
                    position: badges.BadgePosition.topEnd(top: -5, end: -20),
                    showBadge:
                        ref.watch(badgeCountProvider) == 0 ? false : true,
                    child: const Icon(Icons.travel_explore)),
                label: "Ride status")
          ]),
    );
  }
}
