import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royale_flutter/view/welcome_dialog.dart';
import 'route_settings.dart';

import '../data_managment/data_model.dart';

class MainRouter extends StatelessWidget {
  final PageController _controller = PageController();
  final List<RouteConfig> _routes = createRoutes();
  BottomBar _bar;

  @override
  Widget build(BuildContext context) {
    print("MainRouter build");
    _bar = BottomBar(_routes, _controller);
    return Scaffold(
        body: Container(
          color: Colors.lightBlue[100],
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/background_two.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: PageView(
            controller: _controller,
            children: [for (var route in _routes) route.body],
            onPageChanged: _bar.setIndex,
          ),
        ),
        bottomNavigationBar: _bar);
  }

  @override
  void dispose() {
    _controller.dispose();
  }
}

class BottomBar extends StatefulWidget {
  List<RouteConfig> _routes;
  PageController _pageController;
  BottomBar(this._routes, this._pageController);

  _BottomBarState _state;

  setIndex(int index) {
    _state.setIndex(index);
  }

  @override
  _BottomBarState createState() {
    _state = _BottomBarState();
    return _state;
  }
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("bottomBar build");
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        for (final route in widget._routes)
          BottomNavigationBarItem(
            icon: route.icon,
            title: Text(route.title),
          ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: widget._routes[_selectedIndex].color ??
          Theme.of(context).primaryColorLight, //Colors.deepPurple[400],
      onTap: (int index) {
        widget._pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.decelerate);
      },
    );
  }

  setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
