import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/src/features/app/data/database.dart';
import 'package:tyxit_mobile_app/src/core/constant/style/themes.dart';
import 'package:tyxit_mobile_app/src/features/groups/widget/chat_page.dart';
import 'package:tyxit_mobile_app/src/features/groups/widget/create_group_page.dart';
import 'package:tyxit_mobile_app/src/features/groups/widget/groups_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Database(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tyxit Mobile App',
        theme: TyxitThemes.mainTheme(),
        /* Routing
         ********************************/
        routes: {
          '/': (context) => const GroupsPage(),
          '/create_group': (context) => const CreateGroupPage(),
          '/groups': (context) => const ChatPage(),
        },
        onGenerateRoute: (settings) {
          //
        });
  }
}
