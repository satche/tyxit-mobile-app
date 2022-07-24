import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/constants/spacing.dart';

import '../../constants/colors.dart';

class Message extends StatelessWidget {
  final String text;
  final bool isMine; // true if the message is sent by the current user
  // Better integration: init variable user and compare it with the logged in user

  const Message({Key? key, required this.text, this.isMine = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsBase.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isMine ? ColorsBase.yellow : ColorsBase.grey,
          width: 0.75,
        ),
      ),
      child: Padding(
        padding: Spacing.standardContainer,
        child: Text(
          text,
          textAlign: isMine ? TextAlign.right : TextAlign.left,
        ),
      ),
    );

    // Text(text, textAlign: TextAlign.left);
  }
}
