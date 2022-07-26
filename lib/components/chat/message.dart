import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/constants/spacing.dart';

import '../../constants/colors.dart';
import '../../database/database.dart';
import '../../database/models/user.dart';

class Message extends StatelessWidget {
  final String text;
  final User author;
  final DateTime date = DateTime.now();

  Message({Key? key, required this.text, required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context, listen: false);

    return SizedBox(
      width: 10,
      child: Card(
        color: ColorsBase.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color:
                author == db.loggedUser ? ColorsBase.yellow : ColorsBase.grey,
            width: 0.75,
          ),
        ),
        child: Padding(
          padding: Spacing.message,
          child: Column(
            crossAxisAlignment: author == db.loggedUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${author.name}, ${date.hour}:${date.minute}",
                style: TextStyle(
                  fontSize: 12,
                  color: author == db.loggedUser
                      ? ColorsBase.yellow
                      : ColorsBase.grey,
                ),
              ),
              const SizedBox(height: Spacing.tiny),
              Text(text),
            ],
          ),
        ),
      ),
    );

    // Text(text, textAlign: TextAlign.left);
  }
}
