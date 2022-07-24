import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../components/group_list.dart';
import '../components/tyxit_logo.dart';
import '../constants/spacing.dart';
import '../database/database.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TyxitLogo(),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Show notifications',
            onPressed: () {},
          ),
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
