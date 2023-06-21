import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;

  CustomTextWidget({required this.text, this.fontSize = 15, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      maxLines: 4,
      textScaleFactor: 1,
      style: TextStyle(color: Theme.of(context).textTheme.displaySmall!.color, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}

class CustomTextWidget2 extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;

  CustomTextWidget2({required this.text, this.fontSize = 15, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      maxLines: 4,
      textScaleFactor: 1,
      style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
