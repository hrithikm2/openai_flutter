import 'package:chatgpt/app/data/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/db_service.dart';

class HomeController extends GetxController {
  ///VARIABLES
  late TextEditingController sendTextController;

  FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();

  Stream<DocumentSnapshot<Map<String, dynamic>>>? stream;

  @override
  Future<void> onInit() async {
    sendTextController = TextEditingController();
    getTexts();
    String uid = await StorageData.getByKey('uid') ?? "";
    stream = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('chats')
        .doc('withBot')
        .snapshots();
    super.onInit();
  }

  Future<String> getUid() async {
    return await StorageData.getByKey('uid') ?? "";
  }

  ///METHODS

  ///Retrieve messages from db
  void getTexts() async {}

  ///send message from client
  void sendMessage(String user) {
    sendTextController.clear();
    focusNode.requestFocus();
    scrollToBottom();
  }

  ///automatically scroll to the bottom of list.
  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 325), () {
      if (scrollController.hasClients) {
        scrollController.jumpTo(
          scrollController.position.maxScrollExtent,
        );
      }
    });
  }

  Future<void> uploadTextToDB() async {
    await DBService.uploadText(sendTextController.text);
  }
}
