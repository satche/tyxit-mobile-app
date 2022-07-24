import 'package:flutter/material.dart';
import '../../constants/spacing.dart';

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
                horizontal: Spacing.medium, vertical: Spacing.medium),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(Spacing.medium),
                      hintText: "Write message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Spacing.small),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: "Send",
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
