// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/controller/data_controller.dart';
import 'package:inilabstask/services/themeservices.dart';

import '../../widgets/custom_row_widget.dart';
import '../../widgets/custom_space_widget.dart';
import '../../widgets/custom_text_widget.dart';

class HomePage extends StatelessWidget {
  final dataC = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  dataC.userDetails.value!.avatarUrl != null
                      ? Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(dataC.userDetails.value!.avatarUrl!),
                              )))
                      : Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          )),
                  Spacehorizontal(horizontal: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: dataC.userDetails.value!.name ?? "N?A",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
                        text: dataC.userDetails.value!.login!,
                      ),
                      Spacevertical(vertical: 5),
                      Row(
                        children: [
                          const Icon(Icons.people),
                          Spacehorizontal(horizontal: 5),
                          CustomTextWidget(
                            text: dataC.userDetails.value!.followers.toString(),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          Spacehorizontal(horizontal: 15),
                          Icon(Icons.follow_the_signs_outlined),
                          Spacehorizontal(horizontal: 5),
                          CustomTextWidget(
                            text: dataC.userDetails.value!.following.toString(),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Spacevertical(vertical: 35),
              Column(
                children: [
                  customRowElementWidget(
                    title: dataC.userDetails.value!.name ?? "N/A",
                    icon: Icon(Icons.man),
                  ),
                  customRowElementWidget(
                    title: dataC.userDetails.value!.location ?? "N/A",
                    icon: Icon(Icons.house_rounded),
                  ),
                  customRowElementWidget(
                    title: dataC.userDetails.value!.blog ?? 'N/A',
                    icon: Icon(Icons.web_rounded),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
