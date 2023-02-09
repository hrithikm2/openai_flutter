import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
