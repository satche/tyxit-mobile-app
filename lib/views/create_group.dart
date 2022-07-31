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
  String searchRequest = "";

  @override
  void dispose() {
    fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context, listen: false);
    final newGroup = Group(fieldController.text);

    void createAndGotoGroup() {
      db.addGroup(group: newGroup, admin: db.loggedUser!);
      Navigator.popAndPushNamed(context, "/groups",
          arguments: ChatArgs(newGroup));
    }

    askToJoinGroup(Group group) {
      group.addUser(db.loggedUser!);
      Navigator.popAndPushNamed(context, "/");
    }

    Widget askToJoinGroupDialog(Group group) {
      return AlertDialog(
        title: Text("Join group"),
        content: Text("Do you want to join ${group.name}?"),
        actions: [
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Join"),
            onPressed: () => askToJoinGroup(group),
          ),
        ],
      );
    }

    void updateSearchRequest(String value) {
      setState(() {
        searchRequest = value;
      });
    }

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

            // Test new search feature

            const Divider(),

            TextField(
              onChanged: ((value) => updateSearchRequest(value)),
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                labelText: 'Search',
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: Spacing.medium),
              shrinkWrap: true,
              itemCount: db.groups.length,
              itemBuilder: (BuildContext context, int index) {
                final group = db.groups[index];
                final hasUserJoined = group.users.contains(db.loggedUser!);
                if (!hasUserJoined &&
                    group.name
                        .toLowerCase()
                        .contains(searchRequest.toLowerCase())) {
                  return ListTile(
                    leading: Image(image: AssetImage(group.picturePath)),
                    title: Text(group.name),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => askToJoinGroupDialog(group),
                    ),
                  );
                }
                return Container();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
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
