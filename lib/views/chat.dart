import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/avatar.dart';
import 'package:tyxit_mobile_app/components/chat/message_list.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../components/chat/chatbar.dart';
import '../database/models/group.dart';
import 'group_setting.dart';

class ChatArgs {
  final Group group;

  ChatArgs(this.group);
}

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatArgs;

    return Scaffold(
      appBar: AppBar(
        title: Consumer<Database>(builder: (context, db, child) {
          return Text(args.group.name);
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () => Navigator.pushNamed(context, '/group_setting',
                arguments: GroupSettingArgs(args.group)),
          ),
        ],
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
