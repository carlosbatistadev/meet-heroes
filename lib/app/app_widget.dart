import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:meet_heroes/app/app_bindings.dart';
import 'package:meet_heroes/app/pages/detail/detail_bindings.dart';
import 'package:meet_heroes/app/pages/detail/detail_getx_controller.dart';
import 'package:meet_heroes/app/pages/detail/detail_page.dart';
import 'package:meet_heroes/app/pages/favorites/favorites_bindings.dart';
import 'package:meet_heroes/app/pages/favorites/favorites_getx_controller.dart';
import 'package:meet_heroes/app/pages/favorites/favorites_page.dart';
import 'package:meet_heroes/app/pages/home/home_bindings.dart';
import 'package:meet_heroes/app/pages/home/home_getx_controller.dart';
import 'package:meet_heroes/app/pages/home/home_page.dart';
import 'package:meet_heroes/app/pages/search/search_getx_controller.dart';

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
      const Locale('pt', 'BR'),
      const Locale('en', ''),
    ],
    theme: ThemeData(
      primaryColor: Colors.brown,
      accentColor: Colors.brown,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Color(0xFFf8da91),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      scaffoldBackgroundColor: Color(0xFFf8da91),
      fontFamily: 'PressStart2P',
    ),
    initialBinding: AppBindings(),
    initialRoute: AppRoutes.HOME_ROUTE,
    defaultTransition: Transition.fadeIn,
    getPages: <GetPage>[
      GetPage(
        name: AppRoutes.HOME_ROUTE,
        page: () => HomePage(Get.find<HomeGetxController>()),
        binding: HomeBindings(),
      ),
      GetPage(
        name: AppRoutes.SEARCH_ROUTE,
        page: () => SearchPage(Get.find<SearchGetxController>()),
        binding: SearchBindings(),
      ),
      GetPage(
        name: AppRoutes.DETAIL_ROUTE,
        page: () => DetailPage(Get.find<DetailGetxController>()),
        binding: DetailBindings(),
      ),
      GetPage(
        name: AppRoutes.FAVORITES_ROUTE,
        page: () => FavoritesPage(Get.find<FavoritesGetxController>()),
        binding: FavoritesBindings(),
      ),
    ],
  );
}
