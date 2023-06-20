// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/controller/data_controller.dart';
import 'package:inilabstask/services/themeservices.dart';

import '../../widgets/custom_row_widget.dart';
import '../../widgets/custom_space_widget.dart';
import '../../widgets/custom_text_widget.dart';
import 'widgets/grid_widget.dart';
import 'widgets/list_widget.dart';

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            width: Get.width,
            height: 50,
            padding: const EdgeInsets.only(left: 4),
            child: TextFormField(
              onChanged: (value) {
                dataC.searchList(value);
              },
              style: TextStyle(
                color: Theme.of(context).textTheme.displaySmall!.color,
              ),
              decoration: const InputDecoration(hintText: 'Search name or updated at or full name', suffixIcon: Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Spacevertical(vertical: 20),
                if (dataC.onChanged.value == '')
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                    child: Column(
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
                              mainAxisAlignment: MainAxisAlignment.start,
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
                            Spacevertical(vertical: 5),
                            customRowElementWidget(
                              title: dataC.userDetails.value!.email ?? 'N/A',
                              icon: Icon(Icons.email),
                            ),
                            Spacevertical(vertical: 5),
                            customRowElementWidget(
                              title: dataC.userDetails.value!.bio ?? 'N/A',
                              icon: Icon(Icons.favorite_border),
                            ),
                            Spacevertical(vertical: 5),
                            customRowElementWidget(
                              title: dataC.userDetails.value!.location ?? "N/A",
                              icon: Icon(Icons.house_rounded),
                            ),
                            Spacevertical(vertical: 5),
                            customRowElementWidget(
                              title: dataC.userDetails.value!.blog ?? 'N/A',
                              icon: Icon(Icons.web_rounded),
                            ),
                            Spacevertical(vertical: 5),
                            customRowElementWidget(
                              title: dataC.userDetails.value!.location ?? 'N/A',
                              icon: Icon(Icons.house),
                            ),
                            Spacevertical(vertical: 5),
                            customRowElementWidget(
                              title: dataC.userDetails.value!.hireable ?? 'N/A',
                              icon: Icon(Icons.hive_sharp),
                            ),
                            Spacevertical(vertical: 25),
                          ],
                        ),
                      ],
                    ),
                  ),
                Spacevertical(vertical: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomTextWidget(
                          text: 'Repositories',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        Spacehorizontal(horizontal: 5),
                        Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary),
                          child: CustomTextWidget(
                            text: dataC.userDetails.value!.publicRepos.toString() != ''
                                ? dataC.userDetails.value!.publicRepos.toString()
                                : '0',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    dataC.isgridView.value
                        ? GestureDetector(
                            onTap: () {
                              dataC.isgridView.value = !dataC.isgridView.value;
                            },
                            child: const Icon(Icons.list))
                        : GestureDetector(
                            onTap: () {
                              dataC.isgridView.value = !dataC.isgridView.value;
                            },
                            child: Icon(Icons.grid_view))
                  ],
                ),
                Spacevertical(vertical: 15),
                Spacevertical(vertical: 15),
                dataC.repositoryList.isNotEmpty
                    ? dataC.isgridView.value
                        ? GridWidget()
                        : ListWidget()
                    : CustomTextWidget(text: ''),
                Spacevertical(vertical: 15),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
