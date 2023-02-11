import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OpenAIxFlutter extends StatelessWidget {
  const OpenAIxFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/chatgpt.svg',
          width: Get.width / 2,
        ).animate().fadeIn(),
        "\nX\n"
            .text
            .headline2(context)
            .align(TextAlign.center)
            .make()
            .centered()
            .animate()
            .fadeIn(),
        SvgPicture.asset(
          'assets/svgs/flutter.svg',
          width: Get.width / 2,
        ).animate().fadeIn()
      ],
    );
  }
}
