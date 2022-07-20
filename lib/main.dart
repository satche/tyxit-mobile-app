import 'package:flutter/material.dart';
import 'src/core/constant/style/themes.dart';
import 'src/features/groups/widget/groups_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tyxit Mobile App',
      theme: TyxitThemes.mainTheme(),
      home: const GroupsPage(),
    );
  }
}
