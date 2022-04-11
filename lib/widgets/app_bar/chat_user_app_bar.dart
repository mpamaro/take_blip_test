import 'package:flutter/material.dart';

import '../../models/chat_user.dart';
import '../user_avatar.dart';
import 'app_bar_back_button.dart';

class ChatUserAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatUser chatUser;

  const ChatUserAppBar(this.chatUser, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );

    return AppBar(
      leading: const AppBarBackButton(),
      title: Row(
        children: [
          UserAvatar(chatUser),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              chatUser.name,
              style: titleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
