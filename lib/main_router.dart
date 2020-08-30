import 'package:flutter/material.dart';
import 'package:royale_flutter/welcome_dialog.dart';
import 'routes.dart';
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

  final List<RouteL> _routes = createRoutes();

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  void _loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("nickname_")) {
      showDialog(
        context: context,
        builder: (_) => WelcomeDialog(_dialogEnd),
        barrierDismissible: true,
      );
    } else
      print("WTF");
  }

  void _dialogEnd() async {
    //print("debbbbbug");
    //print(prefs.getString("nickname") ?? "no nickname");
    setState(() {
      temp_test = prefs.getString("nickname") ?? "ups";
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    //_createRoutes();
    return Scaffold(
      appBar: _routes[_selectedIndex].appbar,
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
        selectedItemColor: Colors.deepPurple[400],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
