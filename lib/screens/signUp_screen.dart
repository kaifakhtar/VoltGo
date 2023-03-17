import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyUIPage extends StatefulWidget {
  const MyUIPage({Key? key}) : super(key: key);

  @override
  _MyUIPageState createState() => _MyUIPageState();
}

class _MyUIPageState extends State<MyUIPage> {
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
              Text("Sign Up",style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.bold),),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,

                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 200),
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
                  child: Text("Sign Up",
                      style: TextStyle(color: Colors.white,
                      fontSize: 18),),
                ),
              ),
              SizedBox(height: 16.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text("Already have an account?",
                  style: TextStyle(fontSize: 12.sp),),
                  SizedBox(width: 5.w,),
                  Text("Log in",
                    style: TextStyle(color: Colors.blue,fontSize: 12.sp),),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
