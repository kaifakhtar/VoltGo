import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:HarRidePay/screens/login_screen.dart';

import 'package:HarRidePay/screens/onthejourney_screen.dart';
import 'package:HarRidePay/screens/signUp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/car_select_screen.dart';
import './widgets/booking_pickup_dest_widget.dart';
import './screens/booking_pickup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              home:
                  SignUpPage() //LoginScreen()//BookingPickupScreen()//Login()//BookingPickupScreen()//CarSelectScreen(),
              );
        });
  }
}
