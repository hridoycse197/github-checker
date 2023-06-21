// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/controller/data_controller.dart';
import 'package:inilabstask/services/themeservices.dart';

import '../../widgets/custom_space_widget.dart';
import '../../widgets/custom_text_widget.dart';

class LoginPage extends StatelessWidget {
  final dataC = Get.put(DataController());
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: Stack(children: [
                      Positioned(
                        right: 5,
                        top: 4,
                        child: GestureDetector(
                            onTap: () {
                              Themeservices().changeThemeMode();
                            },
                            child: const Icon(Icons.light_mode)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(500)),
                          color: Theme.of(context).colorScheme.background,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              Spacevertical(vertical: kToolbarHeight),

                              //mainAxisAlignment: MainAxisAlignment.start,

                              Image.asset(
                                'assets/github_logo-.png',
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      )
                    ])),
              ),
              Flexible(
                  flex: 5,
                  fit: FlexFit.loose,
                  child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.primary,
                      child: Stack(children: [
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(500)),
                            ),
                            child: Column(
                              children: [
                                Spacevertical(vertical: 100),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 5, offset: Offset(1, 2))
                                    ],
                                    //  borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).colorScheme.onBackground,
                                  ),
                                  width: Get.width * .7,
                                  height: 50,
                                  padding: const EdgeInsets.only(left: 4),
                                  child: TextFormField(
                                    controller: textEditingController,
                                    cursorColor: Colors.black,
                                    decoration: const InputDecoration(hintText: 'Enter github username'),
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
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(content: CustomTextWidget(text: 'Please Type username')));
                                          }
                                          textEditingController.clear();
                                        },
                                        icon: const Icon(Icons.login),
                                        label: CustomTextWidget(text: 'Login')),
                              ],
                            ))
                      ]))
                  //====================== Body Section Start======================
                  )
            ],
          ),
        ),
      ),
    );
  }
}
