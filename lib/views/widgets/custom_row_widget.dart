import 'package:flutter/material.dart';
import 'package:inilabstask/views/widgets/custom_space_widget.dart';

import 'custom_text_widget.dart';

// ignore: must_be_immutable
class customRowElementWidget extends StatelessWidget {
  String title;
  Icon icon;
  customRowElementWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Spacehorizontal(horizontal: 7),
        CustomTextWidget(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
