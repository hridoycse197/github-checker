import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inilabstask/model/user_details_model.dart';
import 'package:inilabstask/services/api_services.dart';

import '../model/repository_model.dart';
import '../views/screens/homepage/home_screen.dart';
import '../views/widgets/custom_text_widget.dart';

class DataController extends GetxController {
  final onChanged = RxString('');
  final loginLoading = RxBool(false);
  final isgridView = RxBool(false);
  final userDetails = Rx<UserDetailsModel?>(null);
  final repositoryList = RxList<RepositoryModel>([]);

  final repositorySearchedList = RxList<RepositoryModel>([]);
  Future<void> submitUser(String username) async {
    loginLoading.value = true;
    try {
      final res = await ApiService().getDynamic(
        path: 'https://api.github.com/users/$username',
      );
      if (res.statusCode == 200) {
        userDetails.value = UserDetailsModel.fromJson(res.data);
        await getRepositories();
        onChanged.value = '';
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

  Future<void> getRepositories() async {
    loginLoading.value = true;
    try {
      final res = await ApiService().getDynamic(
        path: userDetails.value!.reposUrl!,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        final allData = res.data.map((json) => RepositoryModel.fromJson(json as Map<String, dynamic>)).toList().cast<RepositoryModel>()
            as List<RepositoryModel>;
        print(allData.length);
        repositoryList.clear();
        repositorySearchedList.clear();
        repositoryList.addAll(allData);
        repositorySearchedList.addAll(allData);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: CustomTextWidget(text: res.data['message'])));
      }
      loginLoading.value = false;
    } catch (e) {
      loginLoading.value = false;
      print(e);
    }
  }

  searchList(String value) {
    onChanged.value = value;
    if (repositoryList.where((RepositoryModel rep) => rep.name!.toLowerCase().contains(value.toLowerCase())).toList().isNotEmpty) {
      repositorySearchedList.value =
          repositoryList.where((RepositoryModel rep) => rep.name!.toLowerCase().contains(value.toLowerCase())).toList();
    } else if (repositoryList
        .where((RepositoryModel rep) => rep.updatedAt.toString().toLowerCase().contains(value.toLowerCase()))
        .toList()
        .isNotEmpty) {
      repositorySearchedList.value =
          repositoryList.where((RepositoryModel rep) => rep.updatedAt.toString().toLowerCase().contains(value.toLowerCase())).toList();
    } else {
      repositorySearchedList.value =
          repositoryList.where((RepositoryModel rep) => rep.fullName.toString().toLowerCase().contains(value.toLowerCase())).toList();
    }
  }
}
