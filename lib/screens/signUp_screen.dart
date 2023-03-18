
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 final _auth=FirebaseAuth.instance;




  String _email='';
  String _username='';
  String _mob='';
  String _password='';

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


  void _trySubmit()async{
    final isValid=_formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if(isValid){

      UserCredential authResult;
      _formKey.currentState!.save();
      print("username is ${_username}");
      print("email is ${_email}");
      print("password is ${_password}");
      print("mob is ${_mob}");

      authResult =await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign up"),),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(16.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty||!value.contains('@')) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _email=value!;
                  },
                ),
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value!.isEmpty||value.length<4) {
                      return 'Please enter at least 4 characters';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _username=value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Phone no.'),
                  validator: (value) {
                    if (value!.isEmpty||value.length<10) {
                      return 'Please enter 10 digit';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _mob=value!;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty||value.length<4) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value){
                    _password=value!;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _trySubmit();
                  },
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}