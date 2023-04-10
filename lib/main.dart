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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var auth = FirebaseAuth.instance;
  bool isLogin = false;

  void checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIfLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              home: isLogin
                  ? const BookingPickupScreen()
                  : SignUpPage() //LoginScreen()//BookingPickupScreen()//Login()//BookingPickupScreen()//CarSelectScreen(),
              );
        });
  }
}
