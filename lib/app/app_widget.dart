import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:meet_heroes/app/app_bindings.dart';
import 'package:meet_heroes/app/pages/home/home_bindings.dart';
import 'package:meet_heroes/app/pages/home/home_page.dart';

import 'app_routes.dart';
import 'pages/search/search_bindings.dart';
import 'pages/search/search_page.dart';

GetMaterialApp appWidget() {
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Conhecer Heróis',
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('PT', 'BR'),
    ],
    theme: ThemeData(
      primaryColor: Colors.brown,
      accentColor: Colors.brown,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Colors.grey[200],
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      scaffoldBackgroundColor: Colors.grey[200],
    ),
    initialBinding: AppBindings(),
    initialRoute: AppRoutes.HOME_ROUTE,
    getPages: <GetPage>[
      GetPage(
        name: AppRoutes.HOME_ROUTE,
        page: () => HomePage(Get.find()),
        binding: HomeBindings(),
      ),
      GetPage(
        name: AppRoutes.SEARCH_ROUTE,
        page: () => SearchPage(Get.find()),
        binding: SearchBindings(),
      ),
    ],
  );
}
