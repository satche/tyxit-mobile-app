import 'package:flutter/material.dart';

import 'models/group.dart';

class Database extends ChangeNotifier {
  final List<Group> groups = [];

  addGroup(Group group) {
    groups.add(group);
    notifyListeners();
  }

  removeGroup(Group group) {
    groups.remove(group);
    notifyListeners();
  }
}
