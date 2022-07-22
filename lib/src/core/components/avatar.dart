import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String url;
  final double size;

  Avatar({required this.url, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundImage: AssetImage(url),
        radius: size,
      ),
    );
  }
}
