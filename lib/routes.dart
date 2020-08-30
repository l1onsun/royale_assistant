import 'package:flutter/material.dart';
import 'package:royale_flutter/player_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'search_route.dart';

List<RouteL> createRoutes() {
  return [
    RouteL(
      title: "Account",
      icon: Icon(Icons.account_box),
      appbar: AppBar(title: Text("Account")),
      body: PlayerInfo(),
      fullscreen: false,
    ),
    RouteL(
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
    RouteL(
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

class RouteL {
  final Icon icon;
  String title;
  final Widget appbar;
  final Widget body;
  final bool fullscreen;
  RouteL(
      {this.icon,
      this.title,
      this.body,
      this.appbar,
      this.fullscreen = false}) {
    print("create route " + title);
  }
}
