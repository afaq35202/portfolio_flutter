import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        fontFamily: GoogleFonts.merriweatherSans().fontFamily,
        textTheme: const TextTheme(
          labelLarge: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
          labelMedium: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          labelSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
