import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/group.dart';
import '../database/models/user.dart';

class MemberList extends StatefulWidget {
  final Group group;

  const MemberList(this.group, {Key? key}) : super(key: key);
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  /* Actions
   ********************************/
  void removeMember(User user) {
    setState(() {
      widget.group.removeUser(user);
      Provider.of<Database>(context, listen: false).hasUpdateded();
      Navigator.pop(context);
    });
  }

  void confirmUser(User user) {
    setState(() {
      widget.group.confirmUser(user);
      Provider.of<Database>(context, listen: false).hasUpdateded();
      Navigator.pop(context);
    });
  }

  void denyUser(User user) {
    setState(() {
      widget.group.denyUser(user);
      Provider.of<Database>(context, listen: false).hasUpdateded();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context, listen: false);

    /* Dialogs
     ********************************/
    Widget removeMemberDialog(User user) {
      return AlertDialog(
        title: const Text('Remove member'),
        content: const Text('Are you sure you want to remove this member?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Remove'),
            onPressed: () => removeMember(user),
          ),
        ],
      );
    }

    Widget leaveGroupDialog(User user) {
      return AlertDialog(
        title: const Text('Leave group'),
        content: const Text('Are you sure you want to leave this group?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Leave'),
            onPressed: () => {},
          ),
        ],
      );
    }

    Widget confirmUserDialog(User user) {
      return AlertDialog(
        title: Text('Accept ${user.name}'),
        content: Text(
            'You\'re about to accept ${user.name} in your group. Do you want to continue ?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Accept user'),
            onPressed: () => confirmUser(user),
          ),
        ],
      );
    }

    Widget denyUserDialog(User user) {
      return AlertDialog(
        title: Text('Deny ${user.name}'),
        content: Text(
            'You\'re about to deny ${user.name} from your group. Do you want to continue ?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Deny user'),
            onPressed: () => denyUser(user),
          ),
        ],
      );
    }

    /* Icons
     ********************************/

    // Yes / No pending
    Widget pendingIcons(User user, Group group) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Accept user',
            color: ColorsBase.green,
            onPressed: () => showDialog(
              context: context,
              builder: (context) => confirmUserDialog(user),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: "Deny user",
            color: ColorsBase.red,
            onPressed: () => showDialog(
              context: context,
              builder: (context) => denyUserDialog(user),
            ),
          ),
        ],
      );
    }

    // Remove member
    Widget? removeIcon(User user) {
      if (db.loggedUser == widget.group.admin) {
        return IconButton(
          icon: const Icon(
            Icons.delete,
            color: ColorsBase.greyLight,
          ),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => removeMemberDialog(user),
          ),
        );
      }
      return null;
    }

    // Leave group
    Widget leaveIcon(User user) {
      return IconButton(
        icon: const Icon(Icons.exit_to_app),
        tooltip: "Leave group",
        color: ColorsBase.greyLight,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => leaveGroupDialog(user),
        ),
      );
    }

    /* List
     ********************************/

    // Pending member list
    Widget pendingList() {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: Spacing.small),
        itemCount: widget.group.pendingUsers.length,
        itemBuilder: (context, index) {
          final group = widget.group;
          final user = widget.group.pendingUsers[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(user.name),
            trailing: pendingIcons(user, group),
          );
        },
      );
    }

    // Member list
    Widget membersList() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.group.users.length,
        itemBuilder: (context, index) {
          final group = widget.group;
          final user = widget.group.users[index];
          return ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Row(
                children: <Widget>[
                  Text(user.name),
                  const SizedBox(width: Spacing.tiny),
                  if (user == group.admin)
                    const Tooltip(
                      message: 'Admin',
                      child: Icon(
                        Icons.shield,
                        color: ColorsBase.yellow,
                      ),
                    ),
                ],
              ),
              trailing:
                  user == db.loggedUser ? leaveIcon(user) : removeIcon(user));
        },
      );
    }

    /* Template
     ********************************/

    // Empty member list condition
    if (widget.group.users.isEmpty) {
      return Container(
        padding: Spacing.standardContainer,
        alignment: Alignment.center,
        child: const Text(
          "It seems this group has not members yet",
          textAlign: TextAlign.center,
        ),
      );
    }

    // Display template
    return Container(
      padding: Spacing.standardContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.group.pendingUsers.isNotEmpty) ...[
            const Text(
              "Pending members",
              style: TextStyle(fontSize: 12, color: ColorsBase.yellow),
            ),
            const Divider(color: ColorsBase.yellow),
            pendingList()
          ],
          const Text(
            "Members",
            style: TextStyle(fontSize: 12, color: ColorsBase.yellow),
          ),
          const Divider(color: ColorsBase.yellow),
          membersList(),
        ],
      ),
    );
  }
}
