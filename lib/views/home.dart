import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../components/tyxit_logo.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import 'chat.dart';

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
        padding: const EdgeInsets.symmetric(vertical: Spacing.medium),
        child: Consumer<Database>(
          builder: (context, db, child) {
            if (db.groups.isEmpty) {
              return const Center(
                child: Text(
                    "It seems you don' have any groups yet. Why don't you create one?"),
              );
            }
            return ListView.builder(
              itemCount: db.groups.length,
              itemBuilder: (context, index) {
                final group = db.groups[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: Spacing.medium),
                  child: ListTile(
                    leading: Image(image: group.picture),
                    title: Text(group.name.toString()),
                    onTap: () => Navigator.pushNamed(context, "/groups",
                        arguments: ChatArgs(group)),
                  ),
                );
              },
            );
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
