import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/data_controller.dart';
import '../../../widgets/custom_space_widget.dart';
import '../../../widgets/custom_text_widget.dart';

class GridWidget extends StatelessWidget {
  final dataC = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => dataC.repositorySearchedList.isNotEmpty
        ? GridView(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 4, mainAxisSpacing: 4),
            shrinkWrap: true,
            children: dataC.repositorySearchedList
                .map((element) => Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextWidget(
                            text: 'Name: ${element.name ?? 'N/A'}',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          Spacevertical(vertical: 5),
                          CustomTextWidget(
                            text: 'Description: ${element.description ?? 'N/A'}',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          Spacevertical(vertical: 5),
                          CustomTextWidget(
                            text: 'Updated At: ${element.updatedAt != null ? element.updatedAt!.toString().split(' ')[0] : 'N/A'}',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          Spacevertical(vertical: 5),
                          CustomTextWidget(
                            text: 'Visibility:  ${element.visibility ?? 'N/A'}',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          Spacevertical(vertical: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/stagers.png'))),
                                  ),
                                  CustomTextWidget(
                                    text: '${element.stargazersCount ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Spacehorizontal(horizontal: 4),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/forks.png'))),
                                  ),
                                  CustomTextWidget(
                                    text: '${element.forks ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Spacehorizontal(horizontal: 4),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/open_issues.png'))),
                                  ),
                                  CustomTextWidget(
                                    text: '${element.openIssuesCount ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Spacehorizontal(horizontal: 4),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/issues.png'))),
                                  ),
                                  CustomTextWidget(
                                    text: '${element.openIssues ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Spacehorizontal(horizontal: 4),
                              Row(
                                children: [
                                  const Icon(
                                    size: 20,
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  CustomTextWidget(
                                    text: '${element.watchersCount ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                .toList())
        : CustomTextWidget(text: 'No Repository Found with this name'));
  }
}
