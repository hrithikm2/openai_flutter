import 'dart:developer';

import 'package:chatgpt/app/data/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DBService extends GetxService {
  static final db = FirebaseFirestore.instance;

  static Future<void> uploadText(String text) async {
    final data = {'messages': text};
    final uid = await StorageData.getByKey('uid');
    log(uid.toString());
    await db
        .collection('users')
        .doc(uid)
        .collection('chats')
        .doc('withBot')
        .set(data);
  }
}
