import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_heroes/app/pages/home/home_bindings.dart';
import 'package:meet_heroes/app/pages/home/home_page.dart';

import 'app_routes.dart';

GetMaterialApp appWidget() {
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Conhecer Heróis',
    theme: ThemeData(
      primaryColor: Colors.orange[900],
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Colors.grey[50],
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
    ),
    getPages: <GetPage>[
      GetPage(
        name: AppRoutes.HOME_ROUTE,
        page: () => HomePage(Get.find()),
        binding: HomeBindings(),
      ),
    ],
  );
}
