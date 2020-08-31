import 'package:flutter/material.dart';
import 'package:royale_flutter/player_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'search_route.dart';

List<Route_> createRoutes() {
  return [
    Route_(
      title: "Account",
      icon: Icon(Icons.account_box),
      appbar: AppBar(title: Text("Account")),
      body: PlayerInfo(),
      fullscreen: false,
    ),
    Route_(
      title: "Favorite",
      icon: Icon(Icons.star),
      appbar: AppBar(title: Text("Favorite"), actions: [
        RaisedButton(
          child: Text("Clear data"),
          onPressed: () async {
            var p = await SharedPreferences.getInstance();
            p.clear();
          },
        ),
      ]),
      body: Text("Star Text"),
      fullscreen: false,
    ),
    Route_(
      title: "Search",
      icon: Icon(Icons.search),
      appbar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.green,
      ),
      body: SearchRoute(),
      fullscreen: false,
    ),
  ];
}

class Route_ {
  final Icon icon;
  String title;
  final Widget appbar;
  final Widget body;
  final bool fullscreen;
  Route_(
      {this.icon,
      this.title,
      this.body,
      this.appbar,
      this.fullscreen = false}) {
    print("create route " + title);
  }
}
