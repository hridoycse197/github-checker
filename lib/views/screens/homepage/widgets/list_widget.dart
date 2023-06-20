import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/controller/data_controller.dart';

import '../../../widgets/custom_space_widget.dart';
import '../../../widgets/custom_text_widget.dart';

class ListWidget extends StatelessWidget {
  final dataC = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => dataC.repositorySearchedList.isNotEmpty
        ? ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: dataC.repositorySearchedList
                .map((element) => Container(
                      margin: EdgeInsets.only(bottom: 7),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: 'Url: ${element.htmlUrl ?? 'N/A'}',
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
                            text: 'Size:  ${element.size ?? 'N/A'}',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          Spacevertical(vertical: 5),
                          CustomTextWidget(
                            text: 'Visibility:  ${element.visibility ?? 'N/A'}',
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          Spacevertical(vertical: 5),
                          CustomTextWidget(
                            text: 'Languages:  ${element.language ?? 'N/A'}',
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
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/forks.png'))),
                                  ),
                                  Spacehorizontal(horizontal: 4),
                                  CustomTextWidget(
                                    text: '${element.forks ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/open_issues.png'))),
                                  ),
                                  Spacehorizontal(horizontal: 4),
                                  CustomTextWidget(
                                    text: '${element.openIssuesCount ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/issues.png'))),
                                  ),
                                  Spacehorizontal(horizontal: 4),
                                  CustomTextWidget(
                                    text: '${element.openIssues ?? 0}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    size: 20,
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  Spacehorizontal(horizontal: 4),
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
