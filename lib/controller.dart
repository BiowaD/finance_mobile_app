import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    saveTheme(isDarkMode.value);
  }

  void saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
  }
}
