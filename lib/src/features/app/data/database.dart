import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/src/features/groups/data/group.dart';

class Database extends ChangeNotifier {
  final List<Group> groups = [];

  addGroup(Group group) {
    groups.add(group);
    notifyListeners();
  }
}
