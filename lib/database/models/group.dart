import 'package:flutter/material.dart';

class Group {
  final String name;
  late final String picturePath;

  Group({
    required this.name,
    this.picturePath = "assets/images/group_picture/default.png",
  });
}
