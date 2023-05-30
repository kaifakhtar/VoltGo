import 'package:HarRidePay/screens/dashboard_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/user_modal.dart';
import '../utils.dart';
import 'booking_pickup_screen.dart';
import 'signUp_screen.dart';

final userModalProvider = StateProvider<UserModal?>((ref) {
  return null;
});

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String _email = '';
  String _password = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      if (kDebugMode) print("completed");

      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _trySubmit() async {
    //after clicking sign up execute this function
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    try {
      if (isValid) {
        setState(() {
          _isLoading = true;
        });
        UserCredential authResult;
        _formKey.currentState!.save();
        // print("username is ${_username}");
        // print("email is ${_email}");
        // print("password is ${_password}");
        // print("mob is ${_mob}");

        authResult = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        String userId = authResult.user!.uid;

        ref.watch(userIdProvider.notifier).state = userId;

        final usersnapshot = await FirebaseFirestore.instance
            .collection('users registered')
            .doc(userId)
            .get();

        final userDataMap = usersnapshot.data();
        // await FirebaseFirestore.instance
        //     .collection('users registered')
        //     .doc(userId)
        //     .update(userDataMap!);

        ref.watch(userModalProvider.notifier).state =
            UserModal.fromMap(userDataMap);
        //??UserModal(code: "",name: '',userId: "",mobNo: "",email: "",onGoingRideId: "",starPoints:0);
        print(
            "this is logged in user data map from riverpod ${ref.watch(userModalProvider).toString()}");

        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => DashBoardScreen()),
        );
      }
    } on FirebaseAuthException catch (err) {
      setState(() {
        _isLoading = false;
      });
      // if (err.code == "user-not-found") {
      //   print("Rider not found");
      //   //  throw ("user-not-found");
      //   showMySnackbar(context, "Rider not found");
      // }
      switch (err.code) {
        case "user-not-found":
          showMySnackbar(context, "Rider not found");
          break;
        case "wrong-password":
          showMySnackbar(context, "Wrong password");
          break;
        case "invalid-email":
          showMySnackbar(context, "Please enter valid email address");
          break;
        default:
          showMySnackbar(context, "Login failed! Please try again later.");
      }
    } catch (e) {
      showMySnackbar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Sign up"),),
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(
                height: 150.h,
              ),
              Row(
                children: [
                  Text(
                    "Log in",
                    style: GoogleFonts.poppins(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w500,
                        color:const Color(0xffC18A00)),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  // enabledBorder: OutlineInputBorder(
                  //   // borderSide: BorderSide(
                  //   //     width: 3, color: Colors.black), //<-- SEE HERE
                  // )
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(
                height: 320.h,
              ),
              InkWell(
                onTap: _trySubmit,
                child: Container(
                  height: 50.h,
                  width: 328.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.h),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.white),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(fontSize: 14.sp),
                  ),
                  TextButton(
                    child: Text("Sign Up",
                        style: GoogleFonts.poppins(fontSize: 14.sp)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignUpPage()));
                    },
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    ));
  }

// void addUser() async {
//     try {
//       // Get the Firestore instance
//       final firestoreInstance = FirebaseFirestore.instance;

//       // Reference to the 'users online' collection
//       final collectionReference = firestoreInstance.collection('users online');

//       // Create a new user document with the name and mobile number attributes
//       await collectionReference.add({
//         'name': nameController.text,
//         'mobileNumber': mobileNumberController.text,
//       });

//       // Print a success message
//       print('User added successfully!');

//       // Clear the text controllers
//       nameController.clear();
//       mobileNumberController.clear();
//     } catch (e) {
//       // Print an error message
//       print('Error adding user: $e');
//     }
//   }
}
