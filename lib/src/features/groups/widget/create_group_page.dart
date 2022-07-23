import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/src/features/app/data/database.dart';
import 'package:tyxit_mobile_app/src/core/components/avatar.dart';
import 'package:tyxit_mobile_app/src/core/constant/style/spacing.dart';
import 'package:tyxit_mobile_app/src/features/groups/data/group.dart';
import 'package:tyxit_mobile_app/src/features/groups/widget/chat_page.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final fieldController = TextEditingController();

  void onPressed() {
    final db = Provider.of<Database>(context, listen: false);
    final group = Group(name: fieldController.text);
    db.addGroup(group);
    Navigator.pushNamed(context, "/groups");
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
        padding: Spacing.container,
        child: Column(
          children: <Widget>[
            Avatar(url: 'assets/images/group_picture/default.png'),
            TextField(
              controller: fieldController,
              decoration: const InputDecoration(
                labelText: 'Group Name',
              ),
            ),
            ElevatedButton(
              onPressed: () => onPressed(),
              child: const Text("Create Group"),
            ),
          ],
        ),
      ),
    );
  }
}
