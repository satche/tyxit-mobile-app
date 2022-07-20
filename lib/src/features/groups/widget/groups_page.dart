import "package:flutter/material.dart";
import '../../../core/components/tyxit_logo.dart';
import '../../app/data/database.dart';
import '../data/group.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  Database database = Database();

  addGroup(newGroup) {
    setState(() {
      database.addGroup(newGroup);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TyxitLogo(), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Show notifications',
          onPressed: () {},
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Number of groups: ${database.groups.length}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addGroup(Group("test")),
        tooltip: 'Add group',
        child: const Icon(Icons.add),
      ),
    );
  }
}
