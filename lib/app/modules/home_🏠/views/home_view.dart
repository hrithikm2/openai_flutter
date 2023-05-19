import 'package:chatgpt/app/modules/home_%F0%9F%8F%A0/views/components/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';
import 'components/chat_message.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "CHATGPT DEMO".text.make(),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: StreamBuilder<DocumentSnapshot>(
                    stream: homeController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      } else {
                        Map<String, dynamic> data =
                            snapshot.data?.data()! as Map<String, dynamic>;
                        return SingleChildScrollView(
                          controller: homeController.scrollController,
                          child: Column(
                              children: List.generate(
                                  snapshot.data?['messages'].toList().length ??
                                      0,
                                  (index) => ChatMessage(
                                        user: 'user',
                                        textData:
                                            data['messages'].toList()[index],
                                      ),
                                  growable: true)),
                        );
                      }
                    }),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: context.cardColor),
                child: SendTextField(
                  focusNode: homeController.focusNode,
                  controller: homeController.sendTextController,
                  onSend: () => homeController.sendMessage('user'),
                ),
              )
            ],
          ).px16(),
        ));
  }
}
