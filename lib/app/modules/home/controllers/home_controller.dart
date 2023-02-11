import 'package:chatgpt/app/modules/home/views/components/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ///VARIABLES
  late TextEditingController sendTextController;
  RxList<ChatMessage> chatMessages = <ChatMessage>[].obs;
  FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    sendTextController = TextEditingController();
    super.onInit();
  }

  ///METHODS
  ///send message from client
  void sendMessage(String user) {
    chatMessages.add(ChatMessage(
      textData: sendTextController.text,
      user: user,
    ));
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
}
