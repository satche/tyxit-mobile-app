import 'package:flutter/material.dart';

import '../database/models/user.dart';

class MembersManagement extends StatelessWidget {
  const MembersManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = ModalRoute.of(context)!.settings.arguments as List<User>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Group members'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
          );
        },
      ),
    );
  }
}
