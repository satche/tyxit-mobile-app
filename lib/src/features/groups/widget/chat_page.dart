import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/src/features/groups/data/group.dart';
import 'package:tyxit_mobile_app/src/features/groups/widget/groups_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  // const ChatPage(this.currentGroup);
  // final Group currentGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(currentGroup.name),
        leading: BackButton(
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
      ),
      body: const Center(
        child: Text('Chat Page'),
      ),
    );
  }
}
