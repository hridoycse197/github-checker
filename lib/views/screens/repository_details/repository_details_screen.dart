// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/controller/data_controller.dart';
import 'package:inilabstask/services/themeservices.dart';
import 'package:inilabstask/views/screens/loginpage/login_page.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_space_widget.dart';
import '../../widgets/custom_text_widget.dart';

class RepositoryDetailsScreen extends StatelessWidget {
  final dataC = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     GestureDetector(
      //         onTap: () {
      //           Themeservices().changeThemeMode();
      //         },
      //         child: const Icon(Icons.light_mode)),
      //     Spacehorizontal(horizontal: 20)
      //   ],
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(50),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Theme.of(context).colorScheme.primaryContainer,
      //       ),
      //       width: Get.width,
      //       height: 50,
      //       padding: const EdgeInsets.only(left: 4),
      //       child: TextFormField(
      //         onChanged: (value) {
      //           dataC.searchList(value);
      //         },
      //         style: TextStyle(
      //           color: Theme.of(context).textTheme.displaySmall!.color,
      //         ),
      //         decoration: const InputDecoration(hintText: 'Search name or updated at or full name', suffixIcon: Icon(Icons.search)),
      //       ),
      //     ),
      //   ),
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: Container(
                    color: Theme.of(context).colorScheme.onSecondary,
                    child: Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: kToolbarHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Spacer(),
                                CustomTextWidget(
                                  text: 'Repository Details',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Themeservices().changeThemeMode();
                                    },
                                    child: const Icon(Icons.light_mode)),
                                Spacehorizontal(horizontal: 10),
                                GestureDetector(
                                    onTap: () {
                                      Get.offAll(() => LoginPage());
                                    },
                                    child: const Icon(Icons.logout_outlined)),
                                Spacehorizontal(horizontal: 10)
                              ],
                            ),
                          ),
                        ),
                      )
                    ])),
              ),
              //====================== Heading Section End ======================

              //====================== Body Section Start======================
              Flexible(
                  flex: 5,
                  fit: FlexFit.loose,
                  child: Container(
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSecondary,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                          ),
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Spacevertical(vertical: 20),
                                CustomTextWidget2(
                                  text: dataC.selectedRepository.value!.name ?? "N/A",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                Spacevertical(vertical: 15),
                                CustomTextWidget2(
                                  text:
                                      'Created At: ${dataC.proceseddate(dates: dataC.selectedRepository.value!.createdAt!.toString().split(' ')[0])}',
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                                Spacevertical(vertical: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        CustomTextWidget2(
                                          text: dataC.selectedRepository.value!.forksCount != null
                                              ? dataC.selectedRepository.value!.forksCount.toString()
                                              : "0",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomTextWidget2(
                                          text: "Forks",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomTextWidget2(
                                          text: dataC.selectedRepository.value!.watchers != null
                                              ? dataC.selectedRepository.value!.watchers.toString()
                                              : "0",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomTextWidget2(
                                          text: "Watchers",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomTextWidget2(
                                          text: dataC.selectedRepository.value!.openIssuesCount != null
                                              ? dataC.selectedRepository.value!.openIssuesCount.toString()
                                              : "0",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomTextWidget2(
                                          text: "Issues",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomTextWidget2(
                                          text: dataC.selectedRepository.value!.openIssuesCount != null
                                              ? dataC.selectedRepository.value!.openIssuesCount.toString()
                                              : "0",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomTextWidget2(
                                          text: "Issues",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacevertical(vertical: 18),
                                customDivider(width: Get.width, alignment: Alignment.center),
                                Spacevertical(vertical: 18),
                                CustomTextWidget2(text: 'Language: ${dataC.selectedRepository.value!.language ?? "N/A"}'),
                                Spacevertical(vertical: 18),
                                CustomTextWidget2(text: 'Description: ${dataC.selectedRepository.value!.description ?? "N/A"}'),
                                Spacevertical(vertical: Get.height * .6),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  //====================== Body Section Start======================
                  )
            ],
          ),
        ),
      ),
    );
  }
}
