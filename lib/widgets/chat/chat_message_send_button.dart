import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/theme.dart';

class ChatMessageSendButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final double? iconHeight;

  const ChatMessageSendButton(
      {Key? key, this.onPressed, this.height, this.width, this.iconHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: TakeBlipTestTheme.chatMessageSendButtonColor,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          Constants.sendAssetName,
          height: iconHeight,
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        tooltip: 'Enviar',
      ),
    );
  }
}
