import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [

              Container(
                height: 200.h,
                width: double.infinity,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage('assets/images/top_image.jpg'),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
              Text("Log in",style: TextStyle(fontSize: 32.sp),),
              SizedBox(height: 28.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: TextField(
              //     controller: _passwordController,
              //     obscureText: true,
              //
              //     decoration: const InputDecoration(
              //       labelText: 'Password',
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 250),
              // ElevatedButton(
              //   onPressed: () {
              //     // Perform login action
              //   },
              //   child: const Text('Sign up'),
              // ),
              Container(
                height: 50.h,
                width: 328.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text("Log in",
                    style: TextStyle(color: Colors.white,
                        fontSize: 18),),
                ),
              ),
              SizedBox(height: 8,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Already have an account?",
                    style: TextStyle(fontSize: 15),),
                  SizedBox(width: 5,),
                  Text("Log in",
                    style: TextStyle(color: Colors.blue,fontSize: 15),),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
