import 'package:flutter/material.dart';
import "../../components/chat/message.dart";

class Group extends ChangeNotifier {
  final String name;
  late final String picturePath = "assets/images/group_picture/default.png";
  final List<Message> messages = [];

  Group({
    required this.name,
  });

  void addMessage(Message message) {
    messages.add(message);
  }
}
