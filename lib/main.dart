import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes.dart';
import 'main_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp Title Clash',
      theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme()),
      home: MainRouter(),
    );
  }
}
