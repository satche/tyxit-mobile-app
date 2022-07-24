import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyxit_mobile_app/src/core/components/avatar.dart';
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: args.group.picture),
            Text('Welcome to the group ${args.group.name}'),
          ],
        ),
      ),
    );
  }
}
