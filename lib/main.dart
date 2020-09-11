import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'themes.dart';
import 'view/router.dart';
import 'data_managment/data_model.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(FutureProvider<DataModel>(
    initialData: DataModel.blank(),
    create: DataModel.futureCreate,
    child: AssisstantApp(),
  ));
}

class AssisstantApp extends StatelessWidget {
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
