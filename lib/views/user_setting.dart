import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/setting.dart';
import 'package:tyxit_mobile_app/constants/colors.dart';
import '../database/database.dart';
import '../database/models/user.dart';

class UserArgs {
  final User user;

  UserArgs(this.user);
}

class UserSetting extends StatelessWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserArgs;
    final db = Provider.of<Database>(context, listen: false);

    void removeCurrentUser() {
      db.removeUser(args.user);
      Navigator.popAndPushNamed(context, '/');
    }

    void logout() {
      db.logoutUser();
      Navigator.popAndPushNamed(context, '/login');
    }

    final Setting setting = Setting(
      entity: args.user,
      child: <Widget>[
        ListTile(
          title: const Text('Logout'),
          onTap: () => logout(),
          textColor: ColorsBase.red,
        ),
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
