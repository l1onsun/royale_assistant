import 'package:flutter/material.dart';

class InfoBase extends StatelessWidget {
  //Widget child;
  List<Widget> children;
  InfoBase({this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: this.children,
          ),
        ),
      ),
    );
  }
}

class InfoHeader extends StatelessWidget {
  String text;
  IconData icon;
  InfoHeader({this.text, this.icon = Icons.cloud_download});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(this.icon, color: Theme.of(context).primaryColorDark),
      Text(
        '  ' + this.text,
        style: Theme.of(context).textTheme.headline5,
      )
    ]);
  }
}

class InfoLoading extends StatelessWidget {
  AnimationController animationController;

  InfoLoading(this.animationController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
      child: LinearProgressIndicator(),
      // SpinKitThreeBounce(
      //   controller: animationController,
      //   color: Theme.of(context).primaryColorLight,
      //   size: 30.0,
      //   duration: Duration(seconds: 2),
      // )
    );
  }
}
