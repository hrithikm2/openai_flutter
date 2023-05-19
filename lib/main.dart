import 'package:chatgpt/app/data/storage.dart';
import 'package:chatgpt/app/modules/login_%F0%9F%94%91/bindings/login_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'app/modules/home_🏠/bindings/home_binding.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String uid = await StorageData.getByKey('uid') ?? "";
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: uid == "" ? AppPages.initial : AppPages.home,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.keepFactory,
      initialBinding: uid == "" ? LoginBinding() : HomeBinding(),
    ),
  );
}
