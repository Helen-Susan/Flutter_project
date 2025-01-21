import 'package:flutter/material.dart';
import 'package:medical/screens/alarm.dart';
import 'package:medical/screens/doc.dart';
import 'package:medical/screens/medical_dosage.dart';
import 'package:medical/screens/profilepage.dart';
import 'package:medical/screens/pharmacy.dart';
import 'package:medical/screens/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Alarm.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ProfilePage(),
    );
  }
}
