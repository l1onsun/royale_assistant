import 'package:flutter/material.dart';

class FavoriteRoute extends StatefulWidget {
  @override
  _FavoriteRouteState createState() => _FavoriteRouteState();
}

class _FavoriteRouteState extends State<FavoriteRoute>
    with AutomaticKeepAliveClientMixin<FavoriteRoute> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    print("init State _FavoriteRouteState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppBar(title: Text("Favorite")),
        Center(child: Text("Center")),
      ],
    );
  }
}
