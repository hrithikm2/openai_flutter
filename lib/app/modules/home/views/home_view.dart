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
            children: [
              Flexible(
                child: Obx(
                  () => ListView.builder(
                      reverse: true,
                      padding: Vx.m8,
                      itemCount: homeController.chatMessages.length,
                      itemBuilder: (context, index) =>
                          homeController.chatMessages[index]),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: context.cardColor),
                child: SendTextField(
                  controller: homeController.sendTextController,
                  onSend: () => homeController.sendMessage('user'),
                ),
              )
            ],
          ),
        ));
  }
}
