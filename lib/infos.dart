import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InfoBase extends StatelessWidget {
  //Widget child;
  List<Widget> children;
  InfoBase({this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            for (final widget in this.children)
              Padding(
                padding: EdgeInsets.all(10),
                child: widget,
              )
          ],
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
        padding: EdgeInsets.all(30),
        child: SpinKitWave(
          controller: animationController,
          type: SpinKitWaveType.center,
          itemCount: 4,
          color: Theme.of(context).primaryColorLight,
          size: 40.0,
        ));
  }
}
