import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;

  CustomTextWidget({required this.text,  this.fontSize=15, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1,
      style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
