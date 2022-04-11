import 'package:flutter_test/flutter_test.dart';
import 'package:take_blip_test/controllers/load_data.dart';
import 'package:take_blip_test/models/chat_user.dart';

void main() {
  group(
    'Load Data',
    () {
      test(
        'Data should be loaded from JSON asset and stored in a list of chat users',
        () async {
          TestWidgetsFlutterBinding.ensureInitialized();

          List<ChatUser> data = await LoadDataController.readJsonAsset();

          expect(data.isNotEmpty, true);
        },
      );
    },
  );
}
