import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes.dart';
import 'router.dart';
import 'data_managment/data_model.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(Provider(
    create: (context) => DataModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assisstant',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColorLight: Colors.deepPurple[400],
        textTheme: GoogleFonts.nunitoTextTheme(TextTheme(
            headline5:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54))),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainRouter(),
    );
  }
}
