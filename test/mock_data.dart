import 'dart:convert';

import 'package:take_blip_test/models/chat_user.dart';
import 'package:take_blip_test/models/message.dart';

class MockData {
  static Message newMessage() {
    return Message(
      id: 999,
      content: 'Test',
      createdDate: DateTime.now(),
      from: 'me',
      to: 'test@test.com',
      status: 'Sent',
    );
  }

  static ChatUser newChatUser() {
    final message = newMessage();

    return ChatUser(
      identity: 'test@test.com',
      name: 'John Doe',
      lastMessage: message,
      messages: [message],
      image:
          base64Decode('R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
    );
  }
}
