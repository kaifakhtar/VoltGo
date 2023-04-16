import 'dart:math';

import 'package:HarRidePay/modals/driver.dart';
import 'package:HarRidePay/providers/online_driver_provider.dart';
import 'package:HarRidePay/screens/signUp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final driverIdProvider = StateProvider<String>((ref) => "");

class DriverBookedScreen extends ConsumerStatefulWidget {
  //const DriverBookedScreen({super.key});

  Driver driver;

  DriverBookedScreen(this.driver);

  @override
  ConsumerState<DriverBookedScreen> createState() => _DriverBookedScreenState();
}

class _DriverBookedScreenState extends ConsumerState<DriverBookedScreen> {
  int? code;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // ref.watch(driverIdProvider.notifier).state = widget.driver.uid;

    code = Random().nextInt(9000) + 1000 ?? 0000;

    String userID = ref.read(userIdProvider);

    String driverID = ref.read(driverIdProvider);
    print("user id in booked screen is $userID");
    print("driver id in booked screen is $driverID");

    updateOTPInFirestore(userID, code, driverID);
    //'7esR371poUMcDuWHVmH1nWeIgKx2'
    createOnGoingRide(driverID, userID);
  }

  void updateOTPInFirestore(userID, int? code, driverID) {
    //userId = 'DPOGKRIvXMgwivoDtoo978YAgdL2';
    print("driver id in booked screen is $driverID");

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('users registered').doc(userID).update({
      'code': code.toString(),
    }).then((value) {
      print('Code updated in Firestore: $code');
    }).catchError((error) {
      print('Failed to update OTP in Firestore: $error');
    });

    //for driver
    firestore.collection('drivers').doc(driverID).update({
      'passengerCode': code.toString(),
    }).then((value) {
      print('OTP updated in Firestore: $code');
    }).catchError((error) {
      print('Failed to update OTP in Firestore: $error');
    });
  }

  void createOnGoingRide(driverID, passengerID) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      // Define a reference to the 'on going rides' collection

// final CollectionReference driversCollection =
//         FirebaseFirestore.instance.collection('drivers');

      // Fetch the document by uid
      final documentReferenceToDriver =
          _firestore.collection('drivers').doc(driverID);

      final documentSnapshotToDriver = await documentReferenceToDriver.get();
      final driverName = documentSnapshotToDriver.data()?['name'];
      final driverMob = documentSnapshotToDriver.data()?['mob no'];

// extracting data from user
      final documentReferenceToUser =
          _firestore.collection('users registered').doc(passengerID);

      final documentSnapshotToUser = await documentReferenceToUser.get();
      final userName = documentSnapshotToUser.data()?['name'];
      final userMob = documentSnapshotToUser.data()?['mob no'];

      CollectionReference onGoingRidesCollection =
          _firestore.collection('on going rides');

      // Create a new document with the UID as the document ID
      final DocumentReference onGoingRidedocRef =
          await onGoingRidesCollection.add({
        'driverID': driverID,
        'driverName': driverName,
        'passengerID': passengerID,
        'passengerName': userName,
        'startPoint': "snacker",
        'endPoint': "Canteen",
        'code': code
      });

      final String onGoingRideID = onGoingRidedocRef.id;

      documentReferenceToDriver.update({"on going ride id": onGoingRideID});
      documentReferenceToUser.update({"on going ride id": onGoingRideID});

      print('On-going ride document created successfully.');
    } catch (e) {
      print('Error creating on-going ride document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Read the code state from the provider
    return Scaffold(
      body: SafeArea(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 64.h,
          ),
          Image.asset(
            'asset/images/green_tick.png',
            height: 110.h,
            width: 110.w,
          ),
          SizedBox(
            height: 28.h,
          ),
          Container(
            alignment: Alignment.center,
            color: Color(0xff80ED6E),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Yeh! Driver booked.",
                style: GoogleFonts.poppins(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 44.h,
          ),
          Column(
            children: [
              Text(
                "Driver name",
                style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                widget.driver.name,
                style: GoogleFonts.poppins(
                    fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 28.h,
              ),
              Text(
                "Contact number",
                style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "+91 ${widget.driver.mobile}",
                style: GoogleFonts.poppins(
                    fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                "Driver code",
                style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "$code", ////code.state.value
                style: GoogleFonts.poppins(
                    fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      )),
    );
  }
}







//const DriverBookedScreen({super.key});

  // var driverName = '';
  // var driverMob = '';
  // int index;

/////////////////////////////////////////////////////////
  // void generateOtp() {
  //   setState(() {
  //     code = code5; // Replace with your actual logic to generate OTP
  //   });
  // }

  // void updateOTPInFirestore(String userId, int otp) {
  //   userId = 'DPOGKRIvXMgwivoDtoo978YAgdL2';
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   firestore
  //       .collection('users')
  //       .doc(userId)
  //       .collection('otp')
  //       .doc('otp_doc')
  //       .set({
  //     'otp': otp.toString(),
  //     'timestamp': FieldValue
  //         .serverTimestamp(), // Add timestamp to track when the OTP was last updated
  //   }).then((value) {
  //     print('OTP updated in Firestore: $otp');
  //   }).catchError((error) {
  //     print('Failed to update OTP in Firestore: $error');
  //   });
  // }
//////////