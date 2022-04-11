import 'package:flutter/material.dart';

import '../models/chat_user.dart';

class UserAvatar extends StatelessWidget {
  final ChatUser chatUser;
  final double? radius;

  const UserAvatar(this.chatUser, {Key? key, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipOval(
        child: Image.memory(chatUser.image),
      ),
    );
  }
}
