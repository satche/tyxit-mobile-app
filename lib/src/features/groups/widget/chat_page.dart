import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/src/core/components/chatbar.dart';
import 'package:tyxit_mobile_app/src/features/app/data/database.dart';
import 'package:tyxit_mobile_app/src/features/groups/data/group.dart';

class ChatPageArgs {
  final Group group;

  ChatPageArgs(this.group);
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatPageArgs;

    void onPressed() {
      final db = Provider.of<Database>(context, listen: false);
      final group = args.group;
      db.removeGroup(group);
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: args.group.picture),
                Text('Welcome to the group ${args.group.name}'),
                ElevatedButton(
                  child: null,
                  onPressed: () => onPressed(),
                ),
              ],
            ),
          ),
          const Chatbar()
        ],
      ),
    );
  }
}
