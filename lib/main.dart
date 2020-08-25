import 'package:flutter/material.dart';
import 'themes.dart';
import 'main_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp Title Clash',
        theme: myDefaultTheme,
        home: MainRouter() //title: 'Flutter Demo Home Page'),
        );
  }
}
