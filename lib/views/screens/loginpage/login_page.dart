import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/utils/themeservices.dart';

import '../../widgets/custom_space_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.light_mode)],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: Get.width * .4,
              height: 50,
              child: TextFormField(),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Themeservices().ChangeThemeMode();
                },
                icon: Icon(Icons.login),
                label: Text('Login')),
            Spacehorizontal(
              horizontal: 10,
            )
          ],
        ),
      )),
    );
  }
}
