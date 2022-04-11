import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/chat_user.dart';
import '../utils/constants.dart';

class LoadDataController {
  static Future<List<ChatUser>> readJsonAsset() async {
    final String response =
        await rootBundle.loadString(Constants.dataAssetName);

    final jsonData = await jsonDecode(response);

    final List<ChatUser> allChatUser = [];

    for (var data in jsonData) {
      allChatUser.add(ChatUser.fromJson(data));
    }

    return allChatUser;
  }
}
