import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/group.dart';
import '../views/chat.dart';
import 'avatar.dart';

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
            leading: Badge(
              showBadge: group.pendingUsers.isNotEmpty,
              badgeColor: ColorsBase.yellow,
              padding: const EdgeInsets.all(6),
              position: BadgePosition.topEnd(end: 0, top: 0),
              child: Consumer<Database>(
                builder: (context, db, child) {
                  return Avatar(url: group.picturePath, size: 30);
                },
              ),
            ),
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
