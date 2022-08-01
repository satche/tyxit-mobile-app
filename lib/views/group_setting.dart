import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';

import '../components/setting.dart';
import '../database/database.dart';
import '../database/models/group.dart';
import '../database/models/user.dart';

class GroupSettingArgs {
  final Group group;

  GroupSettingArgs(this.group);
}

class GroupSetting extends StatelessWidget {
  const GroupSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GroupSettingArgs;
    final db = Provider.of<Database>(context, listen: false);

    void removeCurrentGroup() {
      db.removeGroup(args.group);
      Navigator.popAndPushNamed(context, '/');
    }

    void leaveCurrentGroup(User user) {
      args.group.removeUser(user);
      Navigator.popAndPushNamed(context, '/');
    }

    Widget deleteGroupDialog() {
      return AlertDialog(
        title: const Text('Delete group'),
        content: const Text('Are you sure you want to delete this group?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () => removeCurrentGroup(),
          ),
        ],
      );
    }

    Widget leaveGroupDialog() {
      final adminMessage = db.loggedUser == args.group.admin
          ? ' A new admin will be chose if you leave this group.'
          : "";

      return AlertDialog(
        title: const Text('Leave group'),
        content:
            Text('Are you sure you want to leave this group ?$adminMessage'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Leave group'),
            onPressed: () => leaveCurrentGroup(db.loggedUser!),
          ),
        ],
      );
    }

    final Setting setting = Setting(
      entity: args.group,
      child: <Widget>[
        ListTile(
          title: const Text('Manage members'),
          onTap: () => Navigator.pushNamed(context, "/members_management",
              arguments: args.group),
        ),
        ListTile(
          title: const Text('Leave group'),
          onTap: () => showDialog(
            context: context,
            builder: (context) => leaveGroupDialog(),
          ),
          textColor: ColorsBase.red,
        ),
        ListTile(
          title: const Text('Delete group'),
          onTap: () => showDialog(
            context: context,
            builder: (context) => deleteGroupDialog(),
          ),
          textColor: ColorsBase.red,
        ),
      ],
    );

    return setting;
  }
}
