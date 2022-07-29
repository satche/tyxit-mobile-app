import 'package:flutter/material.dart';
import '../components/chat/message.dart';
import 'models/user.dart';
import 'models/group.dart';

class Database extends ChangeNotifier {
  final List<Group> groups = [];
  final List<User> users = [];
  late User? loggedUser;

  Database() {
    final User user1 = User(name: 'John Doe');
    final Group group1 = Group(name: 'Blue Banana');
    addUser(user1);
    addGroup(group: group1, admin: user1);
    loginUser(user1);
  }

  void hasUpdateded() {
    notifyListeners();
  }

  /* Groups
  ********************************/
  void addGroup({required Group group, required User admin}) {
    groups.add(group);
    group.users.add(admin);
    group.setAdmin(admin);
    notifyListeners();
  }

  void removeGroup(Group group) {
    groups.remove(group);
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
