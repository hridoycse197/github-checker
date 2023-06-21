import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themeservices {
  final getstorage = GetStorage();
  final storageKey = "darkenabled";

  bool isSavedDarkMode() {
    return getstorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    getstorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
