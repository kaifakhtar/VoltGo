import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/driver.dart';
import '../screens/driver_booked_screen.dart';

class BookDriverButton extends ConsumerStatefulWidget {
  //const BookDriverButton({Key? key}) : super(key: key);
  Driver driver;
  BookDriverButton(this.driver);

  @override
  ConsumerState<BookDriverButton> createState() => _BookDriverButtonState();
}

class _BookDriverButtonState extends ConsumerState<BookDriverButton> {
  @override
  void initState() {
    // TODO: implement initState
    //ref.read(driverIdProvider);

    super.initState();
  }

  void _updateDocumentValue() async {
    String driverUID = ref.read(driverIdProvider.notifier).state;
    try {
      // Get Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final documentReference = firestore.collection('drivers').doc(driverUID);

      final documentSnapshot = await documentReference.get();
      final currentValue = documentSnapshot.data()?['available'];

      // Update the document in the collection
      await firestore
          .collection('drivers')
          .doc(driverUID)
          .update({'available': !currentValue});

      print('Document value updated successfully!');
    } catch (e) {
      print('Failed to update document value: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.watch(driverIdProvider.notifier).state = widget.driver.uid!;
        _updateDocumentValue();
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  DriverBookedScreen(widget.driver)),
        );
      },
      child: Container(
        height: 38.h,
        width: 72.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 3.r,
                spreadRadius: 0.r,
                offset: Offset(0.h, 2.h))
          ],
          borderRadius: BorderRadius.circular(8.r),
          color: Color(0xff80ED6E),
        ),
        child: Center(
          child: Text(
            "Book",
            style: GoogleFonts.poppins(fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
