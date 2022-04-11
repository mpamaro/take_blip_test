import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/chat_user.dart';
import '../../pages/chat.dart';
import '../../utils/constants.dart';
import '../../utils/theme.dart';
import '../user_avatar.dart';

class ChatListTile extends StatelessWidget {
  final ChatUser chatUser;
  final void Function()? refreshChatUsers;

  const ChatListTile(this.chatUser, {Key? key, this.refreshChatUsers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const trailingTextStyle = TextStyle(
      color: TakeBlipTestTheme.listTileTrailingColor,
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
    );

    const titleTextStyle = TextStyle(
      color: TakeBlipTestTheme.listTileTitleColor,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    );

    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Chat(
            chatUser,
            refreshChatUsers: refreshChatUsers,
          ),
        ),
      ),
      leading: UserAvatar(chatUser, radius: 23),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat(Constants.dateFormatShorTime)
                .format(chatUser.lastMessage.createdDate),
            style: trailingTextStyle,
          ),
          Text(
            DateFormat(Constants.dateFormatLongDate)
                .format(chatUser.lastMessage.createdDate),
            style: trailingTextStyle,
          ),
        ],
      ),
      title: Text(
        chatUser.name,
        style: titleTextStyle,
      ),
    );
  }
}
