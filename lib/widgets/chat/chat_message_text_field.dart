import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class ChatMessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final String? hintText;

  const ChatMessageTextField(
      {Key? key, required this.controller, this.width, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: TakeBlipTestTheme.chatMessageTextFieldBorderColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
