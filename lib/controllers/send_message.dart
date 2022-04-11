import '../models/chat_user.dart';
import '../models/message.dart';

class SendMessageController {
  static void sendMessageToChatUser(ChatUser chatUser, String content) {
    if (content.isEmpty) return;

    final List<Message> currentMessages = chatUser.messages;
    currentMessages.sort((a, b) => b.id.compareTo(a.id));

    final int newId = currentMessages.first.id + 1;

    final Message newMessage = Message(
      id: newId,
      content: content,
      createdDate: DateTime.now(),
      from: 'me',
      to: chatUser.identity,
      status: 'Sent',
    );

    chatUser.addNewMessage(newMessage);
  }
}
