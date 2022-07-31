import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          "It seems you don't have any groups yet. Why don't you create one?",
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        final lastMessage =
            group.messages.isEmpty ? null : group.messages.first;

        return Card(
          child: ListTile(
            leading: Image(image: AssetImage(group.picturePath)),
            title: Text(group.name),
            subtitle: Text(
              lastMessage == null
                  ? ""
                  : "${lastMessage.author.name}: ${lastMessage.text}",
              style: const TextStyle(fontSize: 12),
            ),
            onTap: () => Navigator.pushNamed(context, "/groups",
                arguments: ChatArgs(group)),
          ),
        );
      },
    );
  }
}
