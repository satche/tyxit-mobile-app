import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${args.group.name}\'s settings'),
      ),
      body: const Center(
        child: Text('Group Setting'),
      ),
    );
  }
}
