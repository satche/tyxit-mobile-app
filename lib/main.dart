import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database/database.dart';

import 'constants/themes.dart';
import 'views/chat.dart';
import 'views/create_group.dart';
import 'views/home.dart';

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
        '/': (context) => const HomeView(),
        '/create_group': (context) => const CreateGroupView(),
        '/groups': (context) => ChatView(),
      },
    );
  }
}
