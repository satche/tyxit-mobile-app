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

    final Setting setting = Setting(
      entity: args.group,
      child: <Widget>[
        ListTile(
          title: const Text('Delete group'),
          onTap: () => removeCurrentGroup(),
          textColor: ColorsBase.red,
        ),
      ],
    );

    return setting;
  }
}
