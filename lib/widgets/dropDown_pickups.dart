import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownPickUp extends StatefulWidget {
  @override
  State<DropDownPickUp> createState() => _DropDownPickUpState();
  String locationName = "Pick";

  DropDownPickUp(this.locationName);
}

class _DropDownPickUpState extends State<DropDownPickUp> {
  @override
  Widget build(BuildContext context) {
    //String pickUpName="Night Canteen";
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Pick a cab stop'),
                content: SizedBox(
                  width: double.maxFinite,
                  height: 400.h,
                  child: ListView(
                    children: <Widget>[
                      Card(
                          child: ListTile(
                        title: Text('Hostle 7 & 7E'),
                        onTap: () {
                          widget.locationName = "Hostle 7 & 7E";
                          setState(() {});

                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: Text('Snackers'),
                        onTap: () {
                          widget.locationName = "Snackers";
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: Text('Hostle 6'),
                        onTap: () {
                          widget.locationName = "Hostle 6";
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: Text('Night canteen'),
                        onTap: () {
                          widget.locationName = "Night canteen";
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: Text('Dispensary'),
                        onTap: () {
                          widget.locationName = "Dispensary";
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: Text('College gate'),
                        onTap: () {
                          widget.locationName = "College gate";
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: Text('Lecture theature'),
                        onTap: () {
                          widget.locationName = "Lecture theature";
                          setState(() {});
                          Navigator.pop(context);
                        },
                      ))
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        height: 38.h,
        width: 225.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.r,
                spreadRadius: 0.r,
                offset: Offset(0.h, 1.h))
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //SizedBox(width: 10.w,),
              Text(
                widget.locationName,
                style: GoogleFonts.poppins(fontSize: 12.sp),
              ),
              SizedBox(
                width: 75.w,
              ),
              Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
