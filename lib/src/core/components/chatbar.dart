import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/src/core/constant/style/spacing.dart';

class Chatbar extends StatefulWidget {
  const Chatbar({Key? key}) : super(key: key);

  @override
  State<Chatbar> createState() => _ChatbarState();
}

class _ChatbarState extends State<Chatbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Spacing.large, vertical: Spacing.large),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(Spacing.large),
                      hintText: "Write message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => {},
                  elevation: 0,
                  child: const Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
