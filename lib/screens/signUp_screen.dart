import 'package:HarRidePay/modals/user_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';
import 'booking_pickup_screen.dart';
import 'login_screen.dart';

final userIdProvider = StateProvider<String>((ref) => '');

class SignUpPage extends ConsumerStatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String _email = '';
  String _username = '';
  String _mob = '';
  String _password = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
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

  void _trySubmit(ref) async {
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
        UserModal userModal;

        authResult = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        String userId = authResult.user!.uid;

        ref.watch(userIdProvider.notifier).state = userId;

        print("below is from rivepod");
        print(ref.watch(userIdProvider));
        userModal = UserModal.fromMap({
          // creates userModal from input map
          'userId': userId,
          'name': _username,
          'mobNo': _mob,
          'email': _email,
          'onGoingRideId': "",
          'starPoints': 0,
          'code': 0,
          'completedRides': []
        });
        await FirebaseFirestore.instance
            .collection('users registered')
            .doc(userId)

            ///authResult.user!.uid
            //.set(({'name': _username, 'mob no': _mob, 'email': _email}));
            .set(userModal.toMap()); // the usermodal will convert to map
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
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
        case "email-already-in-use":
          showMySnackbar(context, "Email already in use, try logging in.");
          break;
        case "weak-password":
          showMySnackbar(
              context, "Weak password, make it atleast 6 characters");
          break;
        case "invalid-email":
          showMySnackbar(context, "Please enter valid email address");
          break;
        default:
          showMySnackbar(context, "Sign up failed! Please try again later.");
      }
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
                    "Sign up",
                    style: GoogleFonts.poppins(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffC18A00)),
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
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please enter at least 4 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Phone no.'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 10) {
                    return 'Please enter 10 digit';
                  }
                  return null;
                },
                onSaved: (value) {
                  _mob = value!;
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
                height: 100.h,
              ),
              InkWell(
                onTap: () => _trySubmit(ref),
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
                            "Sign Up",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, color: Colors.white),
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
                    "Already have an account?",
                    style: GoogleFonts.poppins(fontSize: 14.sp),
                  ),
                  TextButton(
                    child: Text("Login",
                        style: GoogleFonts.poppins(fontSize: 14.sp)),
                    onPressed: () {
                      //
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()),
                      );
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
}
