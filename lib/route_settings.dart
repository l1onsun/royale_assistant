import 'package:flutter/material.dart';
import 'package:royale_flutter/playerinfo_route.dart';

import 'search_route.dart';
import 'favorite_route.dart';

List<RouteConfig> createRoutes() {
  return [
    RouteConfig(
      title: "Account",
      icon: Icon(Icons.account_circle),
      body: PlayerInfoRoute(),
    ),
    RouteConfig(
      title: "Favorite",
      icon: Icon(Icons.star),
      body: FavoriteRoute(),
    ),
    RouteConfig(
      title: "Search",
      icon: Icon(Icons.search),
      body: SearchRoute(),
    ),
  ];
}

class RouteConfig {
  final Icon icon;
  String title;
  final Widget body;
  final bool fullscreen;
  Color color;
  RouteConfig(
      {this.icon, this.title, this.body, this.color, this.fullscreen = false}) {
    print("create route " + title);
  }
}
