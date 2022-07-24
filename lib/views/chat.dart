import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/database.dart';
import '../components/chatbar.dart';
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
