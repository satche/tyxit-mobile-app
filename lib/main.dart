import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/views/group_setting.dart';
import 'package:tyxit_mobile_app/views/login.dart';
import 'database/database.dart';

import 'constants/themes.dart';
import 'views/chat.dart';
import 'views/create_group.dart';
import 'views/home.dart';
import 'views/user_setting.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Database(),
      child: MainApp(),
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
      routes: {
        '/login': (context) => const LoginView(),
        '/': (context) => const HomeView(),
        '/create_group': (context) => const CreateGroupView(),
        '/groups': (context) => const ChatView(),
        '/group_setting': (context) => const GroupSetting(),
        '/user_setting': (context) => const UserSetting(),
      },
    );
  }
}
