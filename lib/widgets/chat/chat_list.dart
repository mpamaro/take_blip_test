import 'dart:async';

import 'package:flutter/material.dart';

import '../../controllers/load_data.dart';
import '../../models/chat_user.dart';
import '../../utils/theme.dart';
import 'chat_list_tile.dart';
import 'chat_search_text_field.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatUser> _allChatUsers = [];
  List<ChatUser> _visibleChatUsers = [];
  bool dataLoaded = false;

  void _readJsonAsset() async {
    if (_allChatUsers.isEmpty) {
      _allChatUsers = await LoadDataController.readJsonAsset();

      // This [Timer] is responsible to guarantee that the [CircularProgressIndicator] is shown.
      Timer(
        const Duration(milliseconds: 700),
        () => setState(() => dataLoaded = true),
      );

      _refreshVisibleChatUsers();
    }
  }

  void _refreshVisibleChatUsers() {
    setState(() {
      _visibleChatUsers = _allChatUsers
        ..sort((a, b) =>
            b.lastMessage.createdDate.compareTo(a.lastMessage.createdDate));
    });

    if (_searchController.text.isNotEmpty) {
      _filterVisibleChatUser(_searchController.text);
    }
  }

  void _filterVisibleChatUser(String value) => setState(
        () => _visibleChatUsers = _allChatUsers
            .where((element) =>
                element.name.toUpperCase().contains(value.toUpperCase()))
            .toList(),
      );

  @override
  void initState() {
    super.initState();
    _readJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatSearchTextField(
          controller: _searchController,
          onChanged: _filterVisibleChatUser,
        ),
        Expanded(
          child: !dataLoaded
              ? const Center(child: CircularProgressIndicator())
              : _visibleChatUsers.isEmpty
                  ? const Center(child: Text('Nenhum contato encontrado.'))
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        color: TakeBlipTestTheme.listTileDividerColor,
                        thickness: 1.5,
                      ),
                      itemCount: _visibleChatUsers.length,
                      itemBuilder: (context, index) => ChatListTile(
                        _visibleChatUsers[index],
                        refreshChatUsers: _refreshVisibleChatUsers,
                      ),
                    ),
        ),
      ],
    );
  }
}
