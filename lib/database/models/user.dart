import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  final String name;
  late final String picturePath = "assets/images/group_picture/default.png";

  User({
    required this.name,
  });
}
