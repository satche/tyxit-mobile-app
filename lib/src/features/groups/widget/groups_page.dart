import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/src/core/components/tyxit_logo.dart';
import 'package:tyxit_mobile_app/src/core/constant/style/spacing.dart';
import '../../app/data/database.dart';
import 'create_group_page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
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
        padding: const EdgeInsets.symmetric(vertical: Spacing.medium),
        child: Consumer<Database>(
          builder: (context, db, child) {
            if (db.groups.isEmpty) {
              return const Center(
                  child: Text(
                      "It seems you don' have any groups yet. Why don't you create one?"));
            }
            return ListView.builder(
              itemCount: db.groups.length,
              itemBuilder: (context, index) {
                final group = db.groups[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: Spacing.medium),
                  child: ListTile(
                    leading: Image(image: group.picture),
                    title: Text(group.name.toString()),
                    // onTap: () {},
                  ),
                );
              },
            );
          },
        ),
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
