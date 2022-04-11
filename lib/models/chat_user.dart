import 'dart:convert';
import 'dart:typed_data';

import 'message.dart';

class ChatUser {
  final String identity;
  final String name;
  Message lastMessage;
  final List<Message> messages;
  final Uint8List image;

  ChatUser({
    required this.identity,
    required this.name,
    required this.lastMessage,
    required this.messages,
    required this.image,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    List<Message> messages = [];

    for (var message in json['messages']) {
      messages.add(Message.fromJson(message));
    }

    messages.sort((a, b) => b.createdDate.compareTo(a.createdDate));

    return ChatUser(
      identity: json['identity'],
      name: json['name'],
      lastMessage: Message.fromJson(json['last_message']),
      messages: messages,
      image: base64Decode(
        json['image'].substring(json['image'].indexOf(',') + 1),
      ),
    );
  }

  void addNewMessage(Message newMessage) {
    messages.insert(0, newMessage);
    lastMessage = newMessage;
  }
}
