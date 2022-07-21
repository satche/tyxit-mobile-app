import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/src/core/components/avatar.dart';
import 'package:tyxit_mobile_app/src/core/constant/style/spacing.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  onPressed() {
    setState(() {});
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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Group Name',
              ),
            ),
            ElevatedButton(
                onPressed: onPressed, child: const Text("Create Group")),
          ],
        ),
      ),
    );
  }
}
