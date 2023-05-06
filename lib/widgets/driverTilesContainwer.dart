import 'package:HarRidePay/modals/driver.dart';
import 'package:HarRidePay/providers/online_driver_provider.dart';
import 'package:HarRidePay/screens/driver_booked_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'available_riders_tile.dart';

class DriverTilesContainer extends ConsumerStatefulWidget {
  const DriverTilesContainer({Key? key}) : super(key: key);

  @override
  ConsumerState<DriverTilesContainer> createState() =>
      _DriverTilesContainerState();
}

class _DriverTilesContainerState extends ConsumerState<DriverTilesContainer> {
  Stream<QuerySnapshot> getDriversBasedOnAvailbility() {
    // Replace "collectionName" with the name of your Firestore collection
    // Replace "isActive" with the name of the Boolean attribute you want to filter on
    return FirebaseFirestore.instance
        .collection('drivers')
        .where('available',
            isEqualTo: true) // Filter documents where "isActive" is true
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12.r,
              spreadRadius: 1.r,
              offset: Offset(0.h, 0.h))
        ],
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 27.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 24.h,
              ),
              Text(
                "Rides available",
                style: GoogleFonts.poppins(
                    fontSize: 20.sp, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            width: 40.h,
          ),
          StreamBuilder(
              stream: getDriversBasedOnAvailbility(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.size == 0) {
                  return SizedBox(
                      height: 280.h,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                            child: Text(
                          "Oops! No rides available at the moment. Check back soon!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, color: Colors.orange),
                        )),
                      ));
                }

                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
                  child: SizedBox(
                    height: 280.h,
                    child: ListView.builder(
                      itemCount: snapshot.data?.size,
                      itemBuilder: (BuildContext context, int index) {
                        // ref
                        //     .watch(onlineDriverProvider.notifier)
                        //     .state
                        //     .removeAllDriver();
                        // if (!ref
                        //     .watch(onlineDriverProvider.notifier)
                        //     .state
                        //     .hasUid(snapshot.data?.docs[index].id)) {
                        //   ref
                        //       .watch(onlineDriverProvider.notifier)
                        //       .state
                        //       .addDriver(Driver(
                        //           snapshot.data?.docs[index].id,
                        //           snapshot.data?.docs[index]["name"],
                        //           snapshot.data?.docs[index]["mob no"]));
                        // }

                        // print(
                        //     ref.watch(onlineDriverProvider).online_driver_list);

                        print(snapshot.data?.docs[index].id);

                        return AvailableRidersTile(Driver(
                            snapshot.data?.docs[index].id,
                            snapshot.data?.docs[index]["name"],
                            snapshot.data?.docs[index]["mob no"]));
                      },
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
