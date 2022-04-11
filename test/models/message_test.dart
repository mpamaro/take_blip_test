import 'package:flutter_test/flutter_test.dart';

import '../mock_data.dart';

void main() {
  group(
    'Message',
    () {
      test(
        'A new message object should be instantiated',
        () {
          MockData.newMessage();
        },
      );
    },
  );
}
