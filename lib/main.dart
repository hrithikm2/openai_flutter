import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  dotenv.load(fileName: '.env');
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
