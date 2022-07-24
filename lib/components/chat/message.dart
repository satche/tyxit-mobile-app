import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;

  const Message(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
