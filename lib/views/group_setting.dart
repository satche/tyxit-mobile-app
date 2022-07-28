import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';

import '../components/setting.dart';
import '../database/database.dart';
import '../database/models/group.dart';

class GroupSettingArgs {
  final Group group;

  GroupSettingArgs(this.group);
}

class GroupSetting extends StatelessWidget {
  const GroupSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GroupSettingArgs;

    void removeCurrentGroup() {
      final db = Provider.of<Database>(context, listen: false);
      db.removeGroup(args.group);
      Navigator.popAndPushNamed(context, '/');
    }

    Widget confirmationDialog() {
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

    final Setting setting = Setting(
      entity: args.group,
      child: <Widget>[
        ListTile(
          title: const Text('Manage members'),
          onTap: () => Navigator.pushNamed(context, "/members_management",
              arguments: args.group.users),
        ),
        ListTile(
          title: const Text('Delete group'),
          onTap: () => showDialog(
            context: context,
            builder: (context) => confirmationDialog(),
          ),
          textColor: ColorsBase.red,
        ),
      ],
    );

    return setting;
  }
}
