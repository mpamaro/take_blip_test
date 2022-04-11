import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        FocusScope.of(context).unfocus();
      },
      icon: Image.asset(
        Constants.backAssetName,
        height: 15,
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      tooltip: 'Voltar',
    );
  }
}
