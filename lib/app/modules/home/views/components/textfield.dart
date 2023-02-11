import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:velocity_x/velocity_x.dart' as vx;

class SendTextField extends StatelessWidget {
  const SendTextField(
      {super.key,
      required this.controller,
      this.onSend,
      required this.focusNode});
  final TextEditingController controller;
  final void Function()? onSend;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          focusNode: focusNode,
          controller: controller,
          onSubmitted: (val) => onSend?.call(),
          decoration:
              const InputDecoration.collapsed(hintText: "SEND A MESSAGE"),
        ).animate().fadeIn()),
        IconButton(icon: const Icon(Icons.send), onPressed: onSend),
      ],
    ).px16();
  }
}
