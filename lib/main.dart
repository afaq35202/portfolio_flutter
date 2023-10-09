import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_scroll.dart';

import 'home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        fontFamily: GoogleFonts.merriweatherSans.toString(),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
          labelMedium: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          labelSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}