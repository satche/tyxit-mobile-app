import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/avatar.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';

import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/user.dart';

class UserSettingArgs {
  final User user;

  UserSettingArgs(this.user);
}

class UserSetting extends StatelessWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserSettingArgs;

    void removeCurrentUser() {
      final db = Provider.of<Database>(context, listen: false);
      db.removeUser(args.user);
      Navigator.popAndPushNamed(context, '/');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Group settings'),
      ),
      body: Container(
        padding: Spacing.fullWidthContainer,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Avatar(url: args.user.picturePath),
            Spacing.betweenFields,
            Text(args.user.name),
            const SizedBox(height: Spacing.big),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: const Text('Delete account'),
                  onTap: () => removeCurrentUser(),
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
