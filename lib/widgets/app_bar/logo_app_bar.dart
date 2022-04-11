import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => AppBar().preferredSize;

  const LogoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        Constants.logoAssetName,
        height: 20,
      ),
    );
  }
}
