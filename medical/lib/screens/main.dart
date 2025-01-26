import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medical/screens/alarm.dart';
import 'package:medical/screens/doc.dart';
import 'package:medical/screens/medical_dosage.dart';
import 'package:medical/screens/profilepage.dart';
import 'package:medical/screens/pharmacy.dart';
import 'package:medical/screens/login_page.dart';
import 'package:medical/screens/navigation.dart';
import 'package:medical/screens/sign_up.dart';
import 'package:medical/screens/update.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDFlep_4kerrif4nnBmojOiEnuVPdKdXZo",
            authDomain: "medical-fa34e.firebaseapp.com",
            projectId: "medical-fa34e",
            storageBucket: "medical-fa34e.firebasestorage.app",
            messagingSenderId: "920685439917",
            appId: "1:920685439917:web:4caa840ea3e4ea87060f24"));
  } else {
    Firebase.initializeApp();
  }

  // await Alarm.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.ga
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
