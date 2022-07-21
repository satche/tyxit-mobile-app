import "package:flutter/material.dart";
import '../../../core/components/tyxit_logo.dart';
import '../../../core/constant/style/text_styles.dart';
import '../../app/data/database.dart';
import '../data/group.dart';
import 'create_group_page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  Database database = Database();

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
      body: Container(
          // mainAxisAlignment: MainAxisAlignment.center,

          padding: const EdgeInsets.all(8.0),
          child:
              // if (database.groups.isEmpty)
              const Text(
                  "It seems you don' have any groups yet. Why don't you create one?")
          // else ...[
          //   for (Group group in database.groups) Text(group.name),
          // ]
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateGroupPage())),
        tooltip: 'Add group',
        child: const Icon(Icons.add),
      ),
    );
  }
}
