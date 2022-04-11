import 'package:flutter/material.dart';

import '../utils/theme.dart';
import '../widgets/app_bar/logo_app_bar.dart';
import '../widgets/chat/chat_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TakeBlipTestTheme.pageBackgroundColor,
      appBar: LogoAppBar(),
      body: ChatList(),
    );
  }
}
