import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchForRidesButton extends StatelessWidget {
  const SearchForRidesButton({Key? key}) : super(key: key);


  void _searchForRides(){
    FirebaseFirestore.instance.collection('drivers online').snapshots().listen((data) {
      data.docs.forEach((element) {
        print(element['name']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _searchForRides,
      child: Ink(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 6.r,
                  spreadRadius: 1,
                  offset: Offset(0.h, 4.h))
            ],
            borderRadius: BorderRadius.circular(12.h),
            color: Colors.black,
          ),
          height: 50.h,
          width: 285.w,
          child: Center(child: Text("Search for rides",
            style: GoogleFonts.poppins(fontSize: 16.h,color: Colors.white),)
          ),
        ),
      ),
    );
  }
}
