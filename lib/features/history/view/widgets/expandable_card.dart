import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableCard extends StatefulWidget {
  final String pickUp;
  final String drop;
  final String driverName;
  final String driverMob;
  final int code;

  ExpandableCard(
      {required this.pickUp,
      required this.drop,
      required this.driverName,
      required this.driverMob,
      required this.code});

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff539055),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r))),
                alignment: Alignment.center,
                height: 32.h,
                child: Text("Completed",
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.pickUp,
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 20.h,
                            color: Colors.black38,
                          ),
                          Text(
                            widget.drop,
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      height: _isExpanded ? 150.h : 0.0,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Driver Name: ${widget.driverName}',
                                style: GoogleFonts.poppins(fontSize: 12.sp),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Driver mob: ${widget.driverMob}',
                                style: GoogleFonts.poppins(fontSize: 12.sp),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Ride Time: 12:34 PM',
                                style: GoogleFonts.poppins(fontSize: 12.sp),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Code: ${widget.code}',
                                style: GoogleFonts.poppins(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          !_isExpanded ? "see details" : "collapse",
                          style: GoogleFonts.poppins(
                              color: Colors.black45, fontSize: 12.sp),
                        ),
                        Icon(!_isExpanded
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
