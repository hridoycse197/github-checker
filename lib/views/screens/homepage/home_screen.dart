// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/controller/data_controller.dart';
import 'package:inilabstask/services/themeservices.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_row_widget.dart';
import '../../widgets/custom_space_widget.dart';
import '../../widgets/custom_text_widget.dart';
import '../loginpage/login_page.dart';
import 'widgets/grid_widget.dart';
import 'widgets/list_widget.dart';

class HomePage extends StatelessWidget {
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
                                  text: 'Profile',
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
                            () => Column(children: [
                              Spacevertical(vertical: 20),
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
                              Spacevertical(vertical: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Column(
                                  children: [
                                    CustomTextWidget2(
                                      text: dataC.userDetails.value!.name ?? "N/A",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Spacevertical(vertical: 5),
                                    CustomTextWidget2(text: dataC.userDetails.value!.location ?? "N/A"),
                                    Spacevertical(vertical: 5),
                                    CustomTextWidget2(text: dataC.userDetails.value!.bio ?? "N/A"),
                                    Spacevertical(vertical: 18),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            CustomTextWidget2(
                                              text: dataC.userDetails.value!.publicRepos != null
                                                  ? dataC.userDetails.value!.publicRepos.toString()
                                                  : "0",
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomTextWidget2(
                                              text: "Repository",
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            CustomTextWidget2(
                                              text: dataC.userDetails.value!.followers != null
                                                  ? dataC.userDetails.value!.followers.toString()
                                                  : "0",
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomTextWidget2(
                                              text: "Followers",
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            CustomTextWidget2(
                                              text: dataC.userDetails.value!.following != null
                                                  ? dataC.userDetails.value!.following.toString()
                                                  : "0",
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomTextWidget2(
                                              text: "Following",
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Spacevertical(vertical: 18),
                              customDivider(
                                width: Get.width * .8,
                                alignment: Alignment.centerLeft,
                              ),
                              Spacevertical(vertical: 10),
                              customDivider(
                                width: Get.width * .8,
                                alignment: Alignment.centerRight,
                              ),
                              Spacevertical(vertical: 10),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextWidget2(
                                      text: "Repositories",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(children: [
                                      GestureDetector(
                                          onTap: () {
                                            dataC.isgridView.value = !dataC.isgridView.value;
                                          },
                                          child: Icon(
                                            dataC.isgridView.value ? Icons.list : Icons.grid_view,
                                            color: Theme.of(context).colorScheme.onPrimary,
                                          )),
                                      Spacehorizontal(horizontal: 10),
                                      PopupMenuButton<String>(
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(
                                          Icons.settings,
                                          color: Theme.of(context).colorScheme.onPrimary,
                                        ),
                                        onSelected: dataC.choiceAction,
                                        itemBuilder: (BuildContext context) {
                                          return dataC.items.map((String choice) {
                                            return PopupMenuItem<String>(
                                              value: choice,
                                              child: CustomTextWidget2(text: choice),
                                            );
                                          }).toList();
                                        },
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            dataC.isReveresd.value = !dataC.isReveresd.value;
                                            dataC.repositorySearchedList.clear();
                                            if (dataC.isReveresd.value) {
                                              dataC.repositorySearchedList.addAll(dataC.repositoryList.reversed);
                                            } else {
                                              dataC.repositorySearchedList.addAll(dataC.repositoryList);
                                            }
                                          },
                                          child: Icon(
                                            dataC.isReveresd.value ? Icons.arrow_upward : Icons.arrow_downward,
                                            color: Theme.of(context).colorScheme.onPrimary,
                                          ))
                                    ])
                                  ],
                                ),
                              ),
                              dataC.repositoryList.isNotEmpty
                                  ? dataC.isgridView.value
                                      ? GridWidget()
                                      : ListWidget()
                                  : CustomTextWidget(text: ''),
                              Spacevertical(vertical: 40),
                            ]),
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
