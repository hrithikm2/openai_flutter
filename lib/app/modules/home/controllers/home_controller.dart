import 'package:chatgpt/app/modules/home/views/components/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ///VARIABLES
  late TextEditingController sendTextController;
  RxList<ChatMessage> chatMessages = <ChatMessage>[].obs;
  @override
  void onInit() {
    sendTextController = TextEditingController();
    super.onInit();
  }

  ///METHODS
  ///send message from client
  void sendMessage(String user) {
    chatMessages.insert(
        0,
        ChatMessage(
          textData: sendTextController.text,
          user: user,
        ));
    sendTextController.clear();
  }
}
