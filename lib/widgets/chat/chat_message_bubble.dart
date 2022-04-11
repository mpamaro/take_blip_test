import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/message.dart';
import '../../utils/constants.dart';
import '../../utils/theme.dart';

class ChatMessageBubble extends StatelessWidget {
  final Message message;

  const ChatMessageBubble(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMyMessage = message.from == Constants.myMessageId;

    const Radius majorCircularRadius = Radius.circular(15);
    const Radius minorCircularRadius = Radius.circular(2);

    const double majorInsidePadding = 15;
    const double minorInsidePadding = 10;

    const double outsidePadding = 130;

    final TextStyle messageTextStyle = TextStyle(
      color: isMyMessage
          ? TakeBlipTestTheme.myChatMessageTextColor
          : TakeBlipTestTheme.defaultChatMessageTextColor,
      fontSize: 16.0,
    );

    return Container(
      padding: EdgeInsets.only(
        right: isMyMessage ? 0 : outsidePadding,
        left: isMyMessage ? outsidePadding : 0,
      ),
      child: Align(
        alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: minorInsidePadding,
                top: minorInsidePadding,
                left: isMyMessage ? majorInsidePadding : minorInsidePadding,
                right: isMyMessage ? minorInsidePadding : majorInsidePadding,
              ),
              decoration: BoxDecoration(
                color: isMyMessage
                    ? TakeBlipTestTheme.myChatMessageBubbleColor
                    : TakeBlipTestTheme.defaultChatMessageBubbleColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: majorCircularRadius,
                  bottomRight: majorCircularRadius,
                  topLeft:
                      isMyMessage ? majorCircularRadius : minorCircularRadius,
                  topRight:
                      isMyMessage ? minorCircularRadius : majorCircularRadius,
                ),
              ),
              child: Text(
                message.content,
                textAlign: isMyMessage ? TextAlign.right : TextAlign.left,
                style: messageTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                DateFormat(Constants.dateFormatShorTime)
                    .format(message.createdDate),
                style: const TextStyle(
                  color: TakeBlipTestTheme.bottomChatMessageTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
