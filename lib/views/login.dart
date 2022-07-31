import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/tyxit_logo.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/user.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final fieldController = TextEditingController();
    final db = Provider.of<Database>(context, listen: false);

    void login() {
      final username = fieldController.text;
      final user = db.users.firstWhere((user) => user.name == username,
          orElse: () => User(username));
      db.loginUser(user);
      Navigator.popAndPushNamed(context, '/');
    }

    @override
    void dispose() {
      fieldController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const TyxitLogo(),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: Spacing.standardContainer,
        child: Column(
          children: <Widget>[
            TextField(
              controller: fieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            ElevatedButton(onPressed: login, child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
