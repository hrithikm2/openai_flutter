import 'package:chatgpt/app/modules/login/views/components/open_ai_x_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: "Hello wanderer, let's get chatting"
              .text
              .headline2(context)
              .align(TextAlign.center)
              .make()
              .centered()
              .animate()
              .fadeOut(delay: 1.seconds, duration: 500.milliseconds)
              .then()
              .swap(builder: (_, child) => const OpenAIxFlutter())
              .centered()),
      bottomNavigationBar: ElevatedButton(
        onPressed: () => Get.find<LoginController>().signInWithGoogle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: kMinInteractiveDimension,
                child: "Sign in with  "
                    .text
                    .bold
                    .headline6(context)
                    .makeCentered()),
            SvgPicture.asset('assets/svgs/google.svg')
          ],
        ),
      ).p32(),
    );
  }
}
