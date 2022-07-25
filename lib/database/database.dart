import 'package:flutter/material.dart';
import '../components/chat/message.dart';
import 'models/user.dart';
import 'models/group.dart';

class Database extends ChangeNotifier {
  final List<Group> groups = [];
  final List<User> users = [];
  User? loggedUser;

  /* Groups
  ********************************/
  addGroup(Group group) {
    groups.add(group);
    notifyListeners();
  }

  removeGroup(Group group) {
    groups.remove(group);
    notifyListeners();
  }

  addMessageToGroup(Group group, Message message) {
    group.addMessage(message);
    notifyListeners();
  }

  /* Users
  ********************************/
  addUser(User user) {
    users.add(user);
  }

  removeUser(User user) {
    logoutUser();
    users.remove(user);
    notifyListeners();
  }

  loginUser(User user) {
    logoutUser();
    loggedUser = user;
  }

  logoutUser() {
    loggedUser = null;
  }
}
