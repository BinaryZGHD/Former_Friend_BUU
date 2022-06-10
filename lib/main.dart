import 'package:f2fbuu/screens/home.dart';
import 'package:f2fbuu/screens/login.dart';
import 'package:f2fbuu/screens/profile_page.dart';
import 'package:f2fbuu/screens/test.dart';
import 'package:f2fbuu/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: screens_Login( ),
      home: ProfileScreen(),
    );
  }
}