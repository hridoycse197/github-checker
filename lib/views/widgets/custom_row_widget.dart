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
        Expanded(
          flex: 1,
          child: Row(
            children: [
              icon,
              Spacehorizontal(horizontal: 7),
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: CustomTextWidget(
            text: title,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
