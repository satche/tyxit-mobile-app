import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/chat/message_list.dart';
import '../components/avatar.dart';
import '../components/chat/message.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../components/chat/chatbar.dart';
import '../database/models/group.dart';

class ChatArgs {
  final Group group;

  ChatArgs(this.group);
}

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatArgs;

    void removeCurrentGroup() {
      final db = Provider.of<Database>(context, listen: false);
      db.removeGroup(args.group);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(args.group.name),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Consumer<Database>(
            builder: (context, db, child) {
              return MessageList(args.group.messages);
            },
          ),
          Chatbar(group: args.group)
        ],
      ),
    );
  }
}
