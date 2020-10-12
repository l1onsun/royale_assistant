import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royale_flutter/data_managment/api/api_manager.dart';
//import 'themes.dart';
import 'view/main_router.dart';
import 'data_managment/data_model.dart';
import 'package:provider/provider.dart';

void main() async {
  // var channel = Api.ws.emulator.websocket.channel();
  // channel.sink.add("Hello my server");
  // channel.stream.listen((message) {
  //   print(message);
  //   sleep(Duration(seconds: 1));
  //   channel.sink.add("ABRA cadabra");
  //   //channel.sink.close(status.goingAway);
  // });

  runApp(FutureProvider<DataModel>(
    initialData: DataModel.blank(),
    create: DataModel.futureCreate,
    child: AssisstantApp(),
  ));
  print("abra cadabra end of the main");
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
