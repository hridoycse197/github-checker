// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/controller/data_controller.dart';
import 'package:inilabstask/services/themeservices.dart';

import '../../widgets/custom_space_widget.dart';
import '../../widgets/custom_text_widget.dart';

class LoginPage extends StatelessWidget {
  final dataC = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                Themeservices().ChangeThemeMode();
              },
              child: const Icon(Icons.light_mode)),
          Spacehorizontal(horizontal: 20)
        ],
      ),
      body: SafeArea(
          child: Center(
              child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Themeservices().isSavedDarkMode() ? Image.asset('assets/light.gif') : Image.asset('assets/light.gif'),
            Spacevertical(vertical: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              width: Get.width * .9,
              height: 50,
              padding: const EdgeInsets.only(left: 4),
              child: TextFormField(
                onChanged: dataC.onChanged,
                style: TextStyle(
                  color: Theme.of(context).textTheme.displaySmall!.color,
                ),
              ),
            ),
            Spacevertical(vertical: 20),
            dataC.loginLoading.value
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  )
                : ElevatedButton.icon(
                    onPressed: () {
                      if (dataC.onChanged != '') {
                        dataC.submitUser(dataC.onChanged.value);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomTextWidget(text: 'Please Type username')));
                      }
                    },
                    icon: const Icon(Icons.login),
                    label: CustomTextWidget(text: 'Login')),
          ],
        ),
      ))),
    );
  }
}
