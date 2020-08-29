import 'package:flutter/material.dart';
import 'package:royale_flutter/welcome_dialog.dart';
import 'search_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainRouter extends StatefulWidget {
  @override
  _MainRouterState createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {
  int _selectedIndex = 0;
  SharedPreferences prefs;
  String searchQuery = "Search query";
  String temp_test = "AppBar";

  final List<_Route> _routes = [
    _Route(
      title: "Account",
      icon: Icon(Icons.account_box),
      body: Text("Account Text"),
      fullscreen: false,
    ),
    _Route(
      title: "Favorite",
      icon: Icon(Icons.star),
      body: Text("Star Text"),
      fullscreen: false,
    ),
    _Route(
      title: "Search",
      icon: Icon(Icons.search),
      body: Text("Search Text"),
      fullscreen: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadprefs();
  }

  void _loadprefs() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("nickname_")) {
      showDialog(
        context: context,
        builder: (_) => WelcomeDialog(_dialogend),
        barrierDismissible: true,
      );
      setState(() {
        temp_test = prefs.getString("nickname") ?? "nonone";
      });
    } else
      print("WTF");
  }

  void _dialogend() async {
    print("debbbbbug");
    print(prefs.getString("nickname") ?? "no nickname");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text(temp_test)),
      body: _routes[_selectedIndex].body,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (final route in _routes)
            BottomNavigationBarItem(
              icon: route.icon,
              title: Text(route.title),
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchRoute()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}

class _Route {
  final Icon icon;
  String title;
  final Widget body;
  final bool fullscreen;
  _Route({this.icon, this.title, this.body, this.fullscreen}) {
    print("create route");
  }
}

class MyAppBar extends AppBar {}
