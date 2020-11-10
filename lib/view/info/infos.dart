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
        elevation: 4,
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
  String additionalText;
  IconData icon;
  InfoHeader(
      {this.text, this.icon = Icons.cloud_download, this.additionalText});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Icon(this.icon, color: Theme.of(context).primaryColorDark),
        Text(
          '  ' + this.text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ]),
      if (additionalText != null)
        Padding(
            padding: EdgeInsets.only(right: 18),
            child: Text(
              additionalText,
              style: TextStyle(
                  height: 2,
                  fontSize: 14,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500),
            ))
    ]);
  }
}

class InfoLoading extends StatelessWidget {
  // AnimationController animationController;

  InfoLoading();

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

class InfoAtom extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Image leftImage;
  final Image rightImage;

  static const styleLeft = TextStyle(fontWeight: FontWeight.w100, fontSize: 16);
  static const styleRight =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  InfoAtom({this.leftImage, this.leftText, this.rightText, this.rightImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              if (this.leftImage != null) this.leftImage,
              if (this.leftText != null)
                Text(
                  this.leftText,
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                ),
            ],
          ),
          Row(children: [
            if (this.rightText != null)
              Text(
                this.rightText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            if (this.rightImage != null) this.rightImage,
          ])
        ]));
  }
}
