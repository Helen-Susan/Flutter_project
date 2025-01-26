import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import 'package:medical/screens/auth_service.dart';
import 'package:medical/screens/medical_dosage.dart';
import 'package:medical/screens/navigation.dart';
import 'package:medical/screens/profilepage.dart';
import 'package:medical/screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  _login() async {
    final user =
        await _auth.loginUserwithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      log("User logged in");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
    } else {
      log("Login failed :User is null");
    }
  }

  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 169, 194, 236),
          titleSpacing: 20.0,
          toolbarHeight: 100.0,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Welcome User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Text(
              'Log In to continue',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ])),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                    "https://static.vecteezy.com/system/resources/thumbnails/003/667/146/small/health-care-health-insurance-charity-and-medicine-concept-photo.jpg",
                    height: 200,
                    width: 200),
                SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "Enter your email/phone number",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  // Within the `FirstRoute` widget:
                  onPressed: _login,

                  child: Text('Log In'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Text(
                'From',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                'Medicare',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
