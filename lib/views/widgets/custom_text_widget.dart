import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  Color fontColor;
  double fontSize;
  FontWeight fontWeight;

  CustomTextWidget({required this.text, this.fontColor = Colors.white, required this.fontSize, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1,
      style: TextStyle(color: fontColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
