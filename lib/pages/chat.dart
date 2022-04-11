import 'package:flutter/material.dart';

import '../models/chat_user.dart';
import '../utils/theme.dart';
import '../widgets/app_bar/chat_user_app_bar.dart';
import '../widgets/chat/chat_message_list.dart';
import '../widgets/chat/chat_message_send_area.dart';

class Chat extends StatefulWidget {
  final ChatUser chatUser;
  final void Function()? refreshChatUsers;

  const Chat(this.chatUser, {Key? key, this.refreshChatUsers})
      : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Future<bool> _unfocusPreviousPage() async {
    widget.refreshChatUsers?.call();
    FocusScope.of(context).unfocus();
    return true;
  }

  void _refreshMessageList() {
    setState(() => widget.chatUser);
    widget.refreshChatUsers?.call();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _unfocusPreviousPage,
      child: Scaffold(
        backgroundColor: TakeBlipTestTheme.pageBackgroundColor,
        appBar: ChatUserAppBar(widget.chatUser),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: ChatMessageList(widget.chatUser),
              ),
              ChatMessageSendArea(
                widget.chatUser,
                refreshMessageList: _refreshMessageList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
