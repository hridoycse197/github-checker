import 'package:flutter/material.dart';

class customDivider extends StatelessWidget {
  double width;
  Alignment alignment;

  customDivider({super.key, required this.width, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        height: 5,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
