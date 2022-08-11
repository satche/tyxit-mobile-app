import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';

import '../components/avatar.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/group.dart';

class JoinGroupView extends StatefulWidget {
  const JoinGroupView({Key? key}) : super(key: key);

  @override
  _JoinGroupViewState createState() => _JoinGroupViewState();
}

class _JoinGroupViewState extends State<JoinGroupView> {
  String searchRequest = "";

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context, listen: false);

    askToJoinGroup(Group group) {
      group.addUser(db.loggedUser!);
      Navigator.popAndPushNamed(context, "/");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Join request sent to ${group.name}"),
        ),
      );
    }

    Widget askToJoinGroupDialog(Group group) {
      return AlertDialog(
        title: const Text("Join group"),
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
        title: const Text('Join Group'),
      ),
      body: Container(
        padding: Spacing.standardContainer,
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text("Create a new group"),
              leading: const Icon(Icons.group_add),
              onTap: () => Navigator.popAndPushNamed(context, "/create_group"),
            ),
            const Divider(
              height: Spacing.big,
              color: ColorsBase.greyLight,
            ),
            TextField(
              onChanged: ((value) => updateSearchRequest(value)),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search a group',
                  border: OutlineInputBorder()),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: Spacing.medium),
              shrinkWrap: true,
              itemCount: db.groups.length,
              itemBuilder: (BuildContext context, int index) {
                final group = db.groups[index];
                final hasUserJoined = group.users.contains(db.loggedUser!);
                final userIsPending =
                    group.pendingUsers.contains(db.loggedUser!);
                final searchFilter = group.name
                    .toLowerCase()
                    .contains(searchRequest.toLowerCase());
                if (!hasUserJoined && !userIsPending && searchFilter) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Avatar(url: group.picturePath),
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
      // floatingActionButton: FloatingActionButton.extended(
      //   label: const Text('Create Group'),
      //   onPressed: () => createAndGotoGroup(),
      // ),
    );
  }
}
