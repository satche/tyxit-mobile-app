import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/src/features/groups/data/group.dart';
import 'package:tyxit_mobile_app/src/features/groups/widget/groups_page.dart';

class ChatPageArgs {
  final Group group;

  ChatPageArgs(this.group);
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatPageArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.group.name),
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
