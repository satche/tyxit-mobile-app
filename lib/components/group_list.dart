import 'package:flutter/material.dart';
import '../constants/spacing.dart';
import '../database/models/group.dart';
import '../views/chat.dart';

class GroupList extends StatelessWidget {
  final List<Group> groups;

  const GroupList(this.groups, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      return Container(
        padding: Spacing.standardContainer,
        alignment: Alignment.center,
        child: const Text(
          "It seems you don' have any groups yet. Why don't you create one?",
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return Card(
          child: ListTile(
            leading: Image(image: group.picture),
            title: Text(group.name.toString()),
            onTap: () => Navigator.pushNamed(context, "/groups",
                arguments: ChatArgs(group)),
          ),
        );
      },
    );
  }
}
