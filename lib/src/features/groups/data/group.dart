import 'package:flutter/material.dart';

class Group {
  final String name;
  late final AssetImage picture;

  Group({
    required this.name,
    this.picture = const AssetImage('assets/images/group_picture/default.png'),
  });
}
