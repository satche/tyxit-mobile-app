import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String url;
  final double size;

  Avatar({this.size = 60, required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(url),
      radius: size,
    );
  }
}
