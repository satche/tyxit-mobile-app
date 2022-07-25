import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../components/group_list.dart';
import '../components/tyxit_logo.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import 'user_setting.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context, listen: false);
    final user = db.loggedUser;
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
              icon: Image(
                image: AssetImage(user.picturePath),
              ),
            )
        ],
      ),
      body: Container(
        padding: Spacing.fullWidthContainer,
        child: Consumer<Database>(
          builder: (context, db, child) {
            return GroupList(db.groups);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create_group'),
        tooltip: 'Add group',
        child: const Icon(Icons.add),
      ),
    );
  }
}
