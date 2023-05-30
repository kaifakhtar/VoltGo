import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_fonts.dart';
import '../../../../providers/list_of_history_Rides_provider.dart';
import '../../../../screens/login_screen.dart';
import '../../../../widgets/ride_status_widget.dart';
import '../../controller/history_controller.dart';
import '../widgets/expandable_card.dart';

class RideHistoryScreen extends ConsumerStatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RideHistoryScreenState();
}

class _RideHistoryScreenState extends ConsumerState<RideHistoryScreen> {
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
  void initState() {
    super.initState();
    getArrayFromDocument(
            ref.read(userModalProvider)!.userId, 'users registered')
        .then((value) {
      searchForRidesDataFromIds(value, 'TotalRides');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ref.watch(historyRidesListProvider).isEmpty
              ? const Center(
                  child: Text("No recent rides"),
                )
              : SizedBox(
                  height: 600,
                  child: ListView.builder(
                    //separatorBuilder: (BuildContext context, int index) =>  SizedBox(height: 20.h),
                    itemCount: ref.watch(historyRidesListProvider).length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpandableCard(
                        driverName: ref
                            .watch(historyRidesListProvider)[index]
                            .driverName,
                        driverMob: ref
                            .watch(historyRidesListProvider)[index]
                            .driverMobNo,
                        code: ref.watch(historyRidesListProvider)[index].code,
                        pickUp: ref
                            .watch(historyRidesListProvider)[index]
                            .startPoint,
                        drop:
                            ref.watch(historyRidesListProvider)[index].endPoint,
                      );
                    },
                  ),
                ),

          // Adjust the right padding as needed
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
            child: SizedBox(
              height: 44.h,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    final listofRideIDS = getArrayFromDocument(
                            ref.watch(userModalProvider)!.userId,
                            'users registered')
                        .then((value) {
                      searchForRidesDataFromIds(value, 'TotalRides');
                    });
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

          // OutlinedButton.icon(
          //     onPressed: () {
          //       setState(() {
          //         final listofRideIDS = getArrayFromDocument(
          //                 ref.watch(userModalProvider)!.userId,
          //                 'users registered')
          //             .then((value) {
          //           searchForRidesDataFromIds(value, 'TotalRides');
          //         });
          //       });
          //     },
          //     style: ButtonStyle(
          //       side: MaterialStateProperty.all(
          //         const BorderSide(width: 2.0, color: Colors.black),
          //       ),
          //       shape: MaterialStateProperty.all(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //       ),
          //     ),
          //     icon: const Icon(Icons.replay_outlined),
          //     label: const Text("Reload")),
        ],
      ),
    );
  }
}
