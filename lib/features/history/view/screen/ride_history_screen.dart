import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/list_of_history_Rides_provider.dart';
import '../../../../screens/login_screen.dart';
import '../../../../widgets/ride_status_widget.dart';
import '../../controller/history_controller.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Ride history"),
      ),
      body: SafeArea(
        child: ref.watch(historyRidesListProvider).isEmpty
            ? const Center(
                child: Text("No recent rides"),
              )
            : ListView.builder(
                itemCount: ref.watch(historyRidesListProvider).length,
                itemBuilder: (BuildContext context, int index) {
                  return RideStatusWidget(
                    code: ref.watch(historyRidesListProvider)[index].code,
                    driverName:
                        ref.watch(historyRidesListProvider)[index].driverName,
                    driverMobNno:
                        ref.watch(historyRidesListProvider)[index].driverMobNo,
                    pickUP:
                        ref.watch(historyRidesListProvider)[index].startPoint,
                    drop: ref.watch(historyRidesListProvider)[index].endPoint,
                  );
                },
              ),
      ),
    );
  }
}
