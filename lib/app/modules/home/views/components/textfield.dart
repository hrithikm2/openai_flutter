import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SendTextField extends StatelessWidget {
  const SendTextField({super.key, required this.controller, this.onSend});
  final TextEditingController controller;
  final void Function()? onSend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: controller,
          onSubmitted: (val) => onSend?.call(),
          decoration:
              const InputDecoration.collapsed(hintText: "SEND A MESSAGE"),
        )),
        IconButton(icon: const Icon(Icons.send), onPressed: onSend),
      ],
    ).px16();
  }
}
