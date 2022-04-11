import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'utils/constants.dart';
import 'utils/theme.dart';

void main() {
  runApp(const TakeBlipTest());
}

class TakeBlipTest extends StatelessWidget {
  const TakeBlipTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          TakeBlipTestTheme.colorSwatch[900]!.value,
          TakeBlipTestTheme.colorSwatch,
        ),
      ),
      home: const SafeArea(
        child: Home(),
      ),
    );
  }
}
