import 'package:flutter/material.dart';
import '../components/chat/message.dart';
import 'models/user.dart';
import 'models/group.dart';

class Database extends ChangeNotifier {
  final List<Group> groups = [];
  final List<User> users = [];
  late User? loggedUser;

  Database() {
    final User user1 = User('Thomas');
    final User user2 = User('Simon');
    final User user3 = User('Raphael');

    final Group group1 = Group('Blue Banana');
    addUser(user1);
    addUser(user2);
    addUser(user3);

    addGroup(group: group1, admin: user1);
    group1.addUser(user2);
    group1.addUser(user3);

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

  void addMessageToGroup(BuildContext context, Group group, Message message) {
    group.addMessage(context, message);
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
