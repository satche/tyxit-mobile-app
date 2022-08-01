import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../components/avatar.dart';
import '../components/group_list.dart';
import '../components/tyxit_logo.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/user.dart';
import 'user_setting.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context, listen: false);
    User? user = db.loggedUser;

    return Scaffold(
      appBar: AppBar(
        title: const TyxitLogo(),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          if (user != null)
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/user_setting',
                  arguments: UserArgs(user)),
              tooltip: "Settings",
              iconSize: 40,
              icon: Avatar(url: user.picturePath),
            )
        ],
      ),
      body: Container(
        padding: Spacing.fullWidthContainer,
        child: Consumer<Database>(
          builder: (context, db, child) {
            final groups =
                db.groups.where((group) => group.users.contains(user)).toList();
            return GroupList(groups);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/join_group'),
        tooltip: 'Add group',
        child: const Icon(Icons.add),
      ),
    );
  }
}
