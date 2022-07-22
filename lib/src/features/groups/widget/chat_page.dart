import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/src/features/groups/data/group.dart';

class ChatPage extends StatelessWidget {
  const ChatPage(this.currentGroup);
  final Group currentGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentGroup.name),
      ),
      body: const Center(
        child: Text('Chat Page'),
      ),
    );
  }
}
