import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../../components/chat/message.dart";
import '../database.dart';
import 'user.dart';

class Group extends ChangeNotifier {
  String name;
  late final String picturePath = "assets/images/group_picture/default.png";
  final List<Message> messages = [];
  final List<User> users = [];
  User? _admin;

  Group({required this.name});

  void addMessage(Message message) {
    messages.insert(0, message);
  }

  void changeName(context, dynamic group, String newName) {
    name = newName;
    Provider.of<Database>(context, listen: false).hasUpdateded();
  }

  void addUser(User user) {
    users.add(user);
  }

  void removeUser(User user) {
    users.remove(user);
  }

  void setAdmin(User user) {
    _admin = user;
  }
}
