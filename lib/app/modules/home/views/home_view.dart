import 'package:chatgpt/app/modules/home/views/components/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

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
                child: Obx(() => SingleChildScrollView(
                      controller: homeController.scrollController,
                      child: Column(
                          children: List.generate(
                              homeController.chatMessages.length,
                              (index) => homeController.chatMessages[index],
                              growable: true)),
                    )),
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
