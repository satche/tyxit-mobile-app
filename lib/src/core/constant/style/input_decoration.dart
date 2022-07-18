import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

abstract class TyxitInputDecoration {
  static InputDecorationTheme buildDark(TyxitTextStyles textStyle) {
    return InputDecorationTheme(
      fillColor: ColorsBase.grey1,
      filled: true,
      errorStyle: TextStyleBase.textStyles().normal12,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorsBase.red,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: ColorsBase.white.withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorsBase.yellow,
        ),
      ),
      hintStyle: textStyle.label18,
    );
  }
}
