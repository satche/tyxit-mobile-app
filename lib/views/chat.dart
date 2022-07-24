import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                Spacing.betweenFields,
                Text('Welcome to the group ${args.group.name}'),
                Spacing.betweenFields,
                ElevatedButton(
                  child: null,
                  onPressed: () => removeCurrentGroup(),
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
