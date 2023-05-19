import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.textData, required this.user});
  final String textData;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.amber,
          child: user[0].text.make(),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              user.text.black.size(16).make().px12(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.2)),
                constraints: const BoxConstraints(maxWidth: 200),
                child: textData.text.black
                    .align(TextAlign.start)
                    .make()
                    .p16()
                    .animate(effects: [
                  ScaleEffect(
                    duration: 1.seconds,
                  )
                ]),
              ),
            ]),
      ],
    );
  }
}
