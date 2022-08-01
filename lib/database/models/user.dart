import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';

class User extends ChangeNotifier {
  String name;
  late final String picturePath;

  User({
    required this.name,
    this.picturePath = "assets/images/pictures/default.png",
  });

  void changeName(context, dynamic user, String newName) {
    name = newName;
    Provider.of<Database>(context, listen: false).hasUpdateded();
  }
}
