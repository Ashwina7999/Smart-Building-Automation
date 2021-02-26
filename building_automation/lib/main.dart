import 'package:building_automation/floor_page.dart';
import 'package:building_automation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:building_automation/block_page.dart';
import 'package:building_automation/classroom.dart';
import 'package:building_automation/fan_light.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => Login(),
        '/': (context) => BlockPage(),
        '/floor': (context) => FloorPage(),
        '/class': (context) => ClassRoom(),
        '/status': (context) => FanLight(),
      },
    );
  }
}
