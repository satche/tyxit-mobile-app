import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Avatar extends StatelessWidget {
  final String url;
  final double size;

  const Avatar({Key? key, required this.url, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(url),
      maxRadius: size - 5,
    );
  }
}
