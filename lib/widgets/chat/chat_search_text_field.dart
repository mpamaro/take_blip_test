import 'package:flutter/cupertino.dart';

class ChatSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;

  const ChatSearchTextField(
      {Key? key, required this.onChanged, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: CupertinoSearchTextField(
        controller: controller,
        onChanged: onChanged,
        placeholder: 'Pesquise pelo nome do contato...',
      ),
    );
  }
}
