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
      Navigator.popAndPushNamed(context, '/login');
    }

    void logout() {
      db.logoutUser();
      Navigator.popAndPushNamed(context, '/login');
    }

    Widget logoutDialog() {
      return AlertDialog(
        title: const Text('Logout'),
        content:
            const Text('You\'re about to log out. Do you want to continue?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Logout'),
            onPressed: () => logout(),
          ),
        ],
      );
    }

    Widget deleteAccountDialog() {
      return AlertDialog(
        title: const Text('Delete account'),
        content: const Text(
            'You\'re about to delete your account. Do you want to continue?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Delete account'),
            onPressed: () => removeCurrentUser(),
          ),
        ],
      );
    }

    final Setting setting = Setting(
      entity: args.user,
      child: <Widget>[
        ListTile(
          title: const Text('Logout'),
          onTap: () => showDialog(
            context: context,
            builder: (context) => logoutDialog(),
          ),
          textColor: ColorsBase.red,
        ),
        ListTile(
          title: const Text('Delete account'),
          onTap: () => showDialog(
            context: context,
            builder: (context) => deleteAccountDialog(),
          ),
          textColor: ColorsBase.red,
        ),
      ],
    );

    return setting;
  }
}
