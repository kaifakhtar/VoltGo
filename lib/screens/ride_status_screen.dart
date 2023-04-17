import 'package:flutter/material.dart';

import '../widgets/ride_status_widget.dart';

class RideStatusPage extends StatefulWidget {
  const RideStatusPage({super.key});

  @override
  State<RideStatusPage> createState() => _RideStatusPageState();
}

class _RideStatusPageState extends State<RideStatusPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RideStatusWidget(),
    );
  }
}
