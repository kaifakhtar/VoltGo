import 'package:HarRidePay/providers/list_of_history_rides_provider.dart';
import 'package:HarRidePay/providers/on_going_ride_id_provider.dart';
import 'package:HarRidePay/screens/driver_booked_screen.dart';
import 'package:HarRidePay/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_fonts.dart';
import '../widgets/ride_status_widget.dart';

final doesOngoingIDExitProvider = StateProvider((ref) => false);

class RideStatusPage extends ConsumerStatefulWidget {
  const RideStatusPage({super.key});

  @override
  ConsumerState<RideStatusPage> createState() => _RideStatusPageState();
}

class _RideStatusPageState extends ConsumerState<RideStatusPage> {
  late String onGoingRideId;
  // void checkIfDocumentExists() async {
  //   String onGoingID = ref.read(onGoingIDprovider);
  //   DocumentSnapshot documentSnapshot =
  //       await FirebaseFirestore.instance.doc(onGoingID).get();

  //   ref.read(doesOngoingIDExitProvider.notifier).state =
  //       documentSnapshot.exists;
  // }
  // void _fetchData() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('rides')
  //       .doc(ref.read(userModalProvider)!.userId)
  //       .get();

  //   if (snapshot.exists) {
  //     setState(() {
  //       onGoingRideId = snapshot.data()['onGoingRideId'];
  //     });
  //   } else {
  //     print('Document does not exist on Firestore');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    //getOnGoingRideDataFromUserDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String onGoingID = ref.watch(userModalProvider)!.onGoingRideId;
    // bool onGoingIDExits = ref.watch(doesOngoingIDExitProvider);
    // var snap=FirebaseFirestore.instance
    //     .collection('on going rides')
    //     .doc(onGoingID)
    //     .get();

    //checkIfDocumentExists();

    print("in ride status build value of onGoingIDprovider is ${onGoingID}");

    return
        //backgroundColor: Colors.grey[200],
        // body: onGoingIDExits
        //     ?
        Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FutureBuilder<bool>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                      future: retreiveData(onGoingID),
                      //initialData: InitialData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return RideStatusWidget(
                            driverName: snapshot.data["driverName"],
                            code: snapshot.data["code"],
                            driverMobNno: snapshot.data["driverMobNo"],
                            pickUP: snapshot.data["startPoint"],
                            drop: snapshot.data["endPoint"],
                            formattedDateTime: snapshot.data["rideDateTime"],
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return const Center(child: Text("error"));
                      },
                    ),
                  ],
                );
              }

              // return const Center(
              //   child: Text("You have no ongoing rides"),
              // );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(children: [
              SizedBox(
                height: 280.h,
              ),
              Text(
                "You have no ongoing rides",
                style: AppFonts.bodyText20black,
              )
            ]);
          },
          future: isDocExist(onGoingID),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
          child: SizedBox(
            height: 44.h,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  //checkIfDocumentExists();
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 0, 0, 0)),
                side: MaterialStateProperty.all(
                  const BorderSide(width: 2.0, color: Colors.black),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              icon: Icon(
                Icons.replay_outlined,
                color: Colors.white,
                size: 20.h,
              ),
              label: Text(
                "Reload",
                style: AppFonts.bodyText16white,
              ),
            ),
          ),
        )
      ],
    );
    // floatingActionButton: FloatingActionButton.small(
    //   heroTag: null,
    //     child: const Icon(Icons.replay_outlined),
    //     onPressed: () {
    //       setState(() {
    //         //checkIfDocumentExists();
    //       });
    //     });
  }

  Stream<QuerySnapshot>? getRideBasedOnCode() {
    // Replace "collectionName" with the name of your Firestore collection
    // Replace "isActive" with the name of the Boolean attribute you want to filter on
    Stream<QuerySnapshot> querSnap;
    try {
      querSnap = FirebaseFirestore.instance
          .collection('on going rides')
          .where('code',
              isEqualTo: ref.read(
                  codeProvider)) // Filter documents where "isActive" is true
          .snapshots();

      return querSnap;
    } catch (e) {
      print("there was erron in catch");
    }
    // return FirebaseFirestore.instance
    //     .collection('on going rides')
    //     .where('code',
    //         isEqualTo: ref.read(
    //             codeProvider)) // Filter documents where "isActive" is true
    //     .snapshots();
    return null;
  }

  Future<bool> isDocExist(String docID) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("on going rides")
        .doc(docID)
        .get();

    if (documentSnapshot.exists) {
      return true;
    } else {
      return false;
    }
  }

  retreiveData(String onGoingRideID) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("on going rides")
        .doc(onGoingRideID)
        .get();
    return Future.value(documentSnapshot);
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
}
