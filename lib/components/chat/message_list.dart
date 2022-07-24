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
          "There are no message yet.",
          textAlign: TextAlign.center,
        ),
      );
    }
    return Container(
      padding: Spacing.standardContainer,
      child: ListView.builder(
        reverse: true,
        padding: const EdgeInsets.only(bottom: Spacing.huge),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return message;
        },
      ),
    );
  }
}
