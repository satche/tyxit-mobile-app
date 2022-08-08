import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/chat/message_list.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';
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

    return Consumer<Database>(builder: (context, db, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(args.group.name),
          actions: [
            IconButton(
              tooltip: 'Settings',
              onPressed: () => Navigator.pushNamed(context, '/group_setting',
                  arguments: GroupSettingArgs(args.group)),
              icon: Badge(
                badgeColor: ColorsBase.yellow,
                padding: const EdgeInsets.all(2),
                position: BadgePosition.topEnd(end: -2),
                showBadge: args.group.pendingUsers.isNotEmpty &&
                    db.loggedUser == args.group.admin,
                badgeContent: Text(
                  args.group.pendingUsers.length.toString(),
                  style: const TextStyle(color: ColorsBase.yellow),
                ),
                child: const Icon(Icons.settings),
              ),
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
    });
  }
}
