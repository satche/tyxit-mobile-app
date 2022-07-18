import "package:flutter/material.dart";

class TyxitLogo extends StatelessWidget {
  const TyxitLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/logos/logo.png'),
      width: 150,
    );
  }
}
