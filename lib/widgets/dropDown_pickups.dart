import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final pickUpProvider = StateProvider<String>((ref) => "Hostle 7 & 7E");
final dropProvider = StateProvider<String>((ref) => "Snackers");

class DropDownPickUp extends ConsumerStatefulWidget {
  @override
  ConsumerState<DropDownPickUp> createState() => _DropDownPickUpState();
  String locationName = "Pick";
  bool isPickUp;

  DropDownPickUp(this.locationName, this.isPickUp);
}

class _DropDownPickUpState extends ConsumerState<DropDownPickUp> {
  void tileOnTap(isPickUp, locationName) {
    if (isPickUp) {
      ref.watch(pickUpProvider.notifier).state = locationName;
    } else {
      ref.watch(dropProvider.notifier).state = locationName;
    }
  }

  @override
  Widget build(BuildContext context) {
    //String pickUpName="Night Canteen";
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Pick a cab stop'),
                content: SizedBox(
                  width: double.maxFinite,
                  height: 400.h,
                  child: ListView(
                    children: <Widget>[
                      Card(
                          child: ListTile(
                        title: const Text('Hostle 7 & 7E'),
                        onTap: () {
                          tileOnTap(widget.isPickUp, 'Hostle 7 & 7E');
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: const Text('Snackers'),
                        onTap: () {
                          tileOnTap(widget.isPickUp, 'Snackers');
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: const Text('Hostle 6'),
                        onTap: () {
                          tileOnTap(widget.isPickUp, 'Hostle 6');
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: const Text('Night canteen'),
                        onTap: () {
                          tileOnTap(widget.isPickUp, 'Night canteen');
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: const Text('Dispensary'),
                        onTap: () {
                          tileOnTap(widget.isPickUp, 'Dispensary');
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: const Text('College gate'),
                        onTap: () {
                          tileOnTap(widget.isPickUp, 'College gate');
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )),
                      Card(
                          child: ListTile(
                        title: const Text('Lecture theatre'),
                        onTap: () {
                          tileOnTap(widget.isPickUp, 'Lecture theature');
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
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black.withOpacity(0.2),
          //       blurRadius: 6.r,
          //       spreadRadius: 0.r,
          //       offset: Offset(0.h, 1.h))
          // ],
          border: Border.all(color: const Color.fromARGB(255, 218, 218, 218)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //SizedBox(width: 10.w,),
              Text(
                widget.isPickUp
                    ? ref.read(pickUpProvider)
                    : ref.read(dropProvider),
                style: TextStyle(
                    fontFamily: 'HelveticaNeue',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 75.w,
              ),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
