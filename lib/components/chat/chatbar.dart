import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/spacing.dart';
import '../../database/database.dart';
import '../../database/models/group.dart';
import 'message.dart';

class Chatbar extends StatefulWidget {
  final Group group;
  const Chatbar({Key? key, required this.group}) : super(key: key);

  @override
  _ChatbarState createState() => _ChatbarState();
}

class _ChatbarState extends State<Chatbar> {
  final fieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void sendMessage() {
      final db = Provider.of<Database>(context, listen: false);
      db.addMessageToGroup(context, widget.group,
          Message(text: fieldController.text, author: db.loggedUser!));
      fieldController.clear();
    }

    return Form(
      key: _formKey,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: Spacing.standardContainer,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: fieldController,
                  decoration: const InputDecoration(
                    contentPadding: Spacing.standardContainer,
                    hintText: "Type a message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Spacing.small),
              FloatingActionButton(
                onPressed: () => sendMessage(),
                tooltip: "Send",
                elevation: 0,
                child: const Icon(
                  Icons.send,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
