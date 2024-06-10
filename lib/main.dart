import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Grotesk'),
            bodyMedium: TextStyle(fontFamily: 'Grotesk'),
            bodySmall: TextStyle(fontFamily: 'Grotesk')
          ),
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontFamily: 'Grotesk'),
              bodyMedium: TextStyle(fontFamily: 'Grotesk'),
              bodySmall: TextStyle(fontFamily: 'Grotesk')
          ),
        ),
        themeMode: !themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: Welcome(),
      );
    });
  }
}