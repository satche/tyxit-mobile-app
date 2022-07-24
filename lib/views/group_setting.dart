import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/avatar.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';

import '../constants/spacing.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Group settings'),
      ),
      body: Container(
        padding: Spacing.standardContainer,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Avatar(url: args.group.picturePath),
            Spacing.betweenFields,
            Text(args.group.name),
            const SizedBox(height: Spacing.big),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: const Text('Remove group'),
                  onTap: () => removeCurrentGroup(),
                  textColor: ColorsBase.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
