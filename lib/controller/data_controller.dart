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
  final isReveresd = RxBool(false);
  final userDetails = Rx<UserDetailsModel?>(null);
  final repositoryList = RxList<RepositoryModel>([]);
  final selectedRepository = Rx<RepositoryModel?>(null);
  final items = RxList<String>([
    'By Name',
    'By Updated At',
  ]);

  final repositorySearchedList = RxList<RepositoryModel>([]);
  choiceAction(String choice) {
    if (choice == 'By Name') {
      repositorySearchedList.clear();
      repositoryList.sort(
        (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
      );
      repositorySearchedList.addAll(repositoryList);
    } else if (choice == 'By Updated At') {
      repositorySearchedList.clear();
      repositoryList.sort(
        (a, b) => a.updatedAt!.compareTo(b.updatedAt!),
      );
      repositorySearchedList.addAll(repositoryList);
    }
  }

  String proceseddate({required String dates}) {
    if (dates != '') {
      String year = dates.split('-')[0];
      String month = dates.split('-')[1];
      String date = dates.split('-')[2];
      String convertedMonth = '';
      switch (month) {
        case '01':
          convertedMonth = 'January';
          break;
        case '02':
          convertedMonth = 'February';
          break;
        case '03':
          convertedMonth = 'March';
          break;
        case '04':
          convertedMonth = 'April';
          break;
        case '05':
          convertedMonth = 'May';
          break;
        case '06':
          convertedMonth = 'June';
          break;
        case '07':
          convertedMonth = 'July';
          break;
        case '08':
          convertedMonth = 'August';
          break;
        case '09':
          convertedMonth = 'September';
          break;
        case '10':
          convertedMonth = 'October';
          break;
        case '11':
          convertedMonth = 'November';
          break;
        case '12':
          convertedMonth = 'December';
          break;
        default:
      }
      return '${date} ${convertedMonth} ${year}';
    } else {
      return 'N/A';
    }
  }

  List<RepositoryModel> returnFilteredList() {
    return repositoryList;
  }

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
