import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/data_controller.dart';
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
                crossAxisCount: 2, childAspectRatio: 1.6, crossAxisSpacing: 4, mainAxisSpacing: 4),
            shrinkWrap: true,
            children: dataC.repositorySearchedList
                .map((element) => Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                child: CustomTextWidget(text: element.name![0].toString().toUpperCase()),
                              ),
                            ),
                            CustomTextWidget2(
                              text: element.name ?? 'N/A',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextWidget2(
                              text: element.language ?? 'N/A',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList())
        : CustomTextWidget(text: 'No Repository Found with this name'));
  }
}
