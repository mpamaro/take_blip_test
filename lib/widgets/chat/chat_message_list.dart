import 'package:flutter/material.dart';

import '../../models/chat_user.dart';
import '../../models/message.dart';
import 'chat_message_bubble.dart';

class ChatMessageList extends StatelessWidget {
  final ChatUser chatUser;

  const ChatMessageList(this.chatUser, {Key? key}) : super(key: key);

  Widget _itemBuilder(context, index) {
    final Message currentMessage = chatUser.messages[index];
    final bool isLastMessage = currentMessage.id == chatUser.lastMessage.id;

    return Padding(
      padding: EdgeInsets.only(bottom: !isLastMessage ? 15 : 0),
      child: ChatMessageBubble(currentMessage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: chatUser.messages.length,
      itemBuilder: (context, index) => _itemBuilder(context, index),
    );
  }
}
