import 'package:flutter/material.dart';
import '../components/member_list.dart';
import '../database/models/group.dart';

class MembersManagement extends StatelessWidget {
  const MembersManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final group = ModalRoute.of(context)!.settings.arguments as Group;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Group members'),
      ),
      body: MemberList(group),
    );
  }
}
