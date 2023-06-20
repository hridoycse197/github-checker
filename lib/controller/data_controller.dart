import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/model/user_details_model.dart';
import 'package:inilabstask/services/api_services.dart';

import '../views/screens/homepage/home_screen.dart';
import '../views/widgets/custom_text_widget.dart';

class DataController extends GetxController {
  final onChanged = RxString('');
  final loginLoading = RxBool(false);
  final userDetails = Rx<UserDetailsModel?>(null);
  Future<void> submitUser(String username) async {
    loginLoading.value = true;
    try {
      final res = await ApiService().getDynamic(
        path: 'https://api.github.com/users/$username',
      );
      if (res.statusCode == 200) {
        userDetails.value = UserDetailsModel.fromJson(res.data);
        print(userDetails.value!.login);
        Get.to(() => HomePage());
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: CustomTextWidget(text: res.data['message'])));
      }
      loginLoading.value = false;
    } catch (e) {
      loginLoading.value = false;
      print(e);
    }
  }
}
