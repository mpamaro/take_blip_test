import 'package:flutter_test/flutter_test.dart';

import '../mock_data.dart';

void main() {
  group(
    'Chat User',
    () {
      test(
        'A new chat user object should be instantiated',
        () {
          MockData.newChatUser();
        },
      );
    },
  );
}
