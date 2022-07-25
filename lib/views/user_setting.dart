import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/avatar.dart';
import 'package:tyxit_mobile_app/components/setting.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';

import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/user.dart';

class UserArgs {
  final User user; // User or Group

  UserArgs(this.user);
}

class UserSetting extends StatelessWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserArgs;

    void removeCurrentUser() {
      final db = Provider.of<Database>(context, listen: false);
      db.removeUser(args.user);
      Navigator.popAndPushNamed(context, '/');
    }

    final Setting setting = Setting(
      entity: args.user,
      child: <Widget>[
        ListTile(
          title: const Text('Delete account'),
          onTap: () => removeCurrentUser(),
          textColor: ColorsBase.red,
        ),
      ],
    );

    return setting;
  }
}
