import 'package:flutter/material.dart';
import 'package:take_blip_test/controllers/send_message.dart';

import '../../models/chat_user.dart';
import 'chat_message_send_button.dart';
import 'chat_message_text_field.dart';

class ChatMessageSendArea extends StatelessWidget {
  final void Function()? refreshMessageList;
  final ChatUser chatUser;
  final TextEditingController _newMessageController = TextEditingController();

  ChatMessageSendArea(this.chatUser, {Key? key, this.refreshMessageList})
      : super(key: key);

  void _sendMessage() {
    SendMessageController.sendMessageToChatUser(
        chatUser, _newMessageController.text);

    _newMessageController.clear();

    refreshMessageList?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChatMessageTextField(
            controller: _newMessageController,
            width: 325,
            hintText: 'Digite sua mensagem',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ChatMessageSendButton(
              height: 45,
              width: 45,
              iconHeight: 23,
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
