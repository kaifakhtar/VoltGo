import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'available_riders_tile.dart';

class DriverTilesContainer extends StatefulWidget {
  const DriverTilesContainer({Key? key}) : super(key: key);

  @override
  State<DriverTilesContainer> createState() => _DriverTilesContainerState();
}

class _DriverTilesContainerState extends State<DriverTilesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332.w,

      decoration: BoxDecoration(
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
                    fontSize: 12.sp, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            width: 40.h,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('drivers online')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Padding(
                  padding:  EdgeInsets.all(16.w),
                  child: Container(
                    height: 280.h,
                    child: ListView.builder(
                      itemCount: snapshot.data?.size,
                      itemBuilder: (BuildContext context, int index) {
                        print(snapshot.data?.docs[index]["name"]);
                        return AvailableRidersTile(
                            snapshot.data?.docs[index]["name"], snapshot.data?.docs[index]["mob no"]);
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
