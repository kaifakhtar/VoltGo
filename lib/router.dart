import 'package:HarRidePay/screens/dashboard_screen.dart';
import 'package:HarRidePay/screens/login_screen.dart';
import 'package:HarRidePay/screens/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routemaster/routemaster.dart';

final loggedoutRoute = RouteMap(routes:{
  '/':(_)=>  const MaterialPage(child: ProviderScope(child: LoginScreen())),
 // '/signup':(_)=>   MaterialPage(child: ProviderScope(child: SignUpPage())),
} );


final loggedinRoute = RouteMap(routes:{
  '/':(_)=> const MaterialPage(child: ProviderScope(child: DashBoardScreen()))
} );

// final signupRoute = RouteMap(routes:{
//   '/':(_)=>  MaterialPage(child: ProviderScope(child: SignUpPage()))
// } );

