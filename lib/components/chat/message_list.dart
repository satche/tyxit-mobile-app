import 'package:flutter/material.dart';

import '../../constants/spacing.dart';
import 'message.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  const MessageList(this.messages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return Container(
        padding: Spacing.standardContainer,
        alignment: Alignment.center,
        child: const Text(
          "It seems you don' have any groups yet. Why don't you create one?",
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return message;
      },
    );
  }
}
