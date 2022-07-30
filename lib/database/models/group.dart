import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../../components/chat/message.dart";
import '../database.dart';
import 'user.dart';

class Group extends ChangeNotifier {
  String name;
  late final String picturePath = "assets/images/group_picture/default.png";
  final List<Message> messages = [];
  final List<User> pendingUsers = [];
  final List<User> users = [];
  User? admin;

  Group({required this.name});

  void addMessage(Message message) {
    messages.insert(0, message);
  }

  void changeName(context, dynamic group, String newName) {
    name = newName;
    Provider.of<Database>(context, listen: false).hasUpdateded();
  }

  void addUser(User user) {
    pendingUsers.add(user);
  }

  void confirmUser(User user) {
    pendingUsers.remove(user);
    users.add(user);
  }

  void denyUser(User user) {
    pendingUsers.remove(user);
  }

  void removeUser(User user) {
    users.remove(user);
  }

  void setAdmin(User user) {
    admin = user;
  }
}
