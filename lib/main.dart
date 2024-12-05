import 'package:ds_demo_afaq/screens/landingScreen.dart';
import 'package:ds_demo_afaq/utils/constant.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenWidth =window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1',
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        hintColor: COLOR_DARK_BLUE,
        textTheme: screenWidth < 500 ? Text_Theme_Small : Text_Theme_defalt,
        useMaterial3: true,
        fontFamily: "pacific"
      ),
      home: LandingScreen(),
    );
  }
}
