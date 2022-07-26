import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../../components/chat/message.dart";
import '../database.dart';

class Group extends ChangeNotifier {
  String name;
  late final String picturePath = "assets/images/group_picture/default.png";
  final List<Message> messages = [];

  Group({
    required this.name,
  });

  void addMessage(Message message) {
    messages.insert(0, message);
  }

  void changeName(context, dynamic group, String newName) {
    Provider.of<Database>(context, listen: false).editGroupName(group, newName);
  }
}
