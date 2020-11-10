import 'package:flutter/material.dart';

navigate(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return Container(
      color: Colors.lightBlue[100],
      child: widget,
    );
  }));
}
