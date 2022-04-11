import 'package:flutter_test/flutter_test.dart';
import 'package:take_blip_test/controllers/send_message.dart';
import 'package:take_blip_test/models/chat_user.dart';

import '../mock_data.dart';

void main() {
  group(
    'Send Message',
    () {
      final ChatUser chatUser = MockData.newChatUser();

      test(
        'Message should be sent and stored in the chat user messages list',
        () {
          SendMessageController.sendMessageToChatUser(chatUser, 'Hello!');

          expect(chatUser.messages.length, 2);
        },
      );

      test(
        'Message should be sent and stored as chat user first message in the list',
        () {
          SendMessageController.sendMessageToChatUser(chatUser, 'Hello!');

          expect(chatUser.messages.first, chatUser.lastMessage);
        },
      );

      test(
        'Message should be sent and stored as chat user last message',
        () {
          SendMessageController.sendMessageToChatUser(chatUser, 'Hello!');

          expect(chatUser.lastMessage, chatUser.messages.first);
        },
      );
    },
  );
}
