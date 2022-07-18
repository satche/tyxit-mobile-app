import 'package:flutter/material.dart';
import 'colors.dart';

abstract class TyxitTextSelection {
  static TextSelectionThemeData buildDark() {
    return const TextSelectionThemeData(
      cursorColor: ColorsBase.white,
    );
  }
}
