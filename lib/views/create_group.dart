import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/avatar.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/group.dart';
import 'chat.dart';

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({Key? key}) : super(key: key);

  @override
  _CreateGroupViewState createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  final fieldController = TextEditingController();

  void createAndGotoGroup() {
    final db = Provider.of<Database>(context, listen: false);
    final group = Group(name: fieldController.text);
    db.addGroup(group: group, admin: db.loggedUser!);
    Navigator.popAndPushNamed(context, "/groups", arguments: ChatArgs(group));
  }

  @override
  void dispose() {
    fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Group'),
      ),
      body: Container(
        padding: Spacing.standardContainer,
        child: Column(
          children: <Widget>[
            const Avatar(url: 'assets/images/group_picture/default.png'),
            Spacing.betweenFields,
            TextField(
              controller: fieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Group Name',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create Group'),
        onPressed: () => createAndGotoGroup(),
      ),
    );
  }
}
