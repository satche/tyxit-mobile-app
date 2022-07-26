import 'package:flutter/material.dart';
import '../components/chat/message.dart';
import 'models/user.dart';
import 'models/group.dart';

class Database extends ChangeNotifier {
  final List<Group> groups = [];
  final List<User> users = [];
  User? loggedUser;

  Database() {
    final User user1 = User(name: 'John Doe');
    final Group group1 = Group(name: 'Blue Banana');
    addUser(user1);
    addGroup(group1);
    loginUser(user1);
  }

  /* Groups
  ********************************/
  void addGroup(Group group) {
    groups.add(group);
    notifyListeners();
  }

  void removeGroup(Group group) {
    groups.remove(group);
    notifyListeners();
  }

  void editGroupName(Group group, String newName) {
    var groupIndex = groups.indexOf(group);
    groups[groupIndex].name = newName;
    notifyListeners();
  }

  void addMessageToGroup(Group group, Message message) {
    group.addMessage(message);
    notifyListeners();
  }

  /* Users
  ********************************/
  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  void removeUser(User user) {
    logoutUser();
    users.remove(user);
    notifyListeners();
  }

  void editUserName(User user, String newName) {
    var userIndex = users.indexOf(user);
    users[userIndex].name = newName;
    notifyListeners();
  }

  void loginUser(User user) {
    logoutUser();
    loggedUser = user;
    notifyListeners();
  }

  logoutUser() {
    loggedUser = null;
    notifyListeners();
  }
}
