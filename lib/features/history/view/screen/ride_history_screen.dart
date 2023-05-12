import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      
      body: SafeArea(
        child: ref.watch(historyRidesListProvider).isEmpty
            ? const Center(
                child: Text("No recent rides"),
              )
            : ListView.builder(
              //separatorBuilder: (BuildContext context, int index) =>  SizedBox(height: 20.h),
                itemCount: ref.watch(historyRidesListProvider).length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpandableCard(
                    driverName: ref.watch(historyRidesListProvider)[index].driverName,
                    driverMob: ref.watch(historyRidesListProvider)[index].driverMobNo,
                    code:ref.watch(historyRidesListProvider)[index].code ,
                    pickUp: ref.watch(historyRidesListProvider)[index].startPoint,
                    drop: ref.watch(historyRidesListProvider)[index].endPoint,
                  );
                },
              ),
            
      ),
     floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.replay_outlined),
          onPressed: () {
            setState(() {
               final listofRideIDS = getArrayFromDocument(
                        ref.watch(userModalProvider)!.userId,
                        'users registered')
                    .then((value) {
                  searchForRidesDataFromIds(value, 'TotalRides');
            });
            }
            );
            }
            ));
    
       
  }
}
