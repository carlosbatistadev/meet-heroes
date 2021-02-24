import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetMaterialApp appWidget() {
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Conhecer Heróis',
    theme: ThemeData(
      primaryColor: Colors.orange[900],
    ),
  );
}
