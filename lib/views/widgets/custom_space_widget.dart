import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Spacevertical extends StatelessWidget {
  double vertical;
   Spacevertical({
  required this.vertical
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vertical,
    );
  }
}
// ignore: must_be_immutable
class Spacehorizontal extends StatelessWidget {
  double horizontal;
   Spacehorizontal({
  required this.horizontal
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizontal,
    );
  }
}