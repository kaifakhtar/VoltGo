//import 'package:HarRidePay/router.dart';
import 'package:HarRidePay/features/auth/auth_controller.dart';
import 'package:HarRidePay/modals/user_modal.dart';
import 'package:HarRidePay/router.dart';
import 'package:HarRidePay/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:HarRidePay/screens/login_screen.dart';

import 'package:HarRidePay/screens/onthejourney_screen.dart';
import 'package:HarRidePay/screens/signUp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:routemaster/routemaster.dart';
import 'screens/car_select_screen.dart';
import './widgets/booking_pickup_dest_widget.dart';
import './screens/booking_pickup_screen.dart';
import 'screens/driver_booked_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModal? userModal;
  var auth = FirebaseAuth.instance;
  bool isLogin = false;

  void getUserData(WidgetRef ref, User data) async {
    userModal =
        await ref.watch(authControllerProvider).getUserdata(data.uid).first;
    ref.watch(userModalProvider.notifier).state = userModal;
    setState(() {});
  }

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
   // checkIfLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: ref.watch(authStateChangeProvider).when(
            data: (data) => ScreenUtilInit(
                  designSize: const Size(360, 800),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return MaterialApp.router(
                      routerDelegate:
                          RoutemasterDelegate(routesBuilder: (context) {
                        if (data != null) {
                          getUserData(ref, data);
                          if (userModal != null) {
                            return loggedinRoute;
                          }
                        }

                        return loggedoutRoute;
                      }),
                      routeInformationParser: const RoutemasterParser(),
                      // home: DashBoardScreen(),
                      //  home: isLogin
                      //      ?   DashBoardScreen()
                      //      : SignUpPage() //LoginScreen()//BookingPickupScreen()//Login()//BookingPickupScreen()//CarSelectScreen(),
                    );
                  },
                ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
