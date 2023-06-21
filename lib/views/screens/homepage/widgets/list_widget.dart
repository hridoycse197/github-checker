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
        ? 
         Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: dataC.repositorySearchedList
                                      .map((element) => Card(
                                            elevation: 2,
                                            child: ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                                child: CustomTextWidget(text: element.name![0].toString().toUpperCase()),
                                              ),
                                              trailing: Icon(
                                                Icons.remove,
                                                color: Theme.of(context).colorScheme.onPrimary,
                                              ),
                                              title: Align(
                                                alignment: Alignment.centerLeft,
                                                child: CustomTextWidget2(
                                                  text: element.name ?? 'N/A',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              subtitle: Align(
                                                alignment: Alignment.centerLeft,
                                                child: CustomTextWidget2(
                                                  text: element.language ?? 'N/A',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              )
                             : CustomTextWidget(text: 'No Repository Found with this name'));
  }
}
