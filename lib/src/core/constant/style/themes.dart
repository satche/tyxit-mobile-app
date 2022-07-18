import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'input_decoration.dart';
import 'text_selection.dart';
import 'text_styles.dart';

class TyxitThemes {
  static ThemeData mainTheme() {
    final textStyles = TextStyleBase.textStyles();
    return ThemeData.dark().copyWith(
      textTheme: GoogleFonts.robotoTextTheme(TextStyleBase.baseTextTheme()),
      primaryColor: ColorsBase.yellow,
      backgroundColor: ColorsBase.grey1,
      scaffoldBackgroundColor: ColorsBase.black,
      canvasColor: ColorsBase.grey2,
      primaryColorDark: ColorsBase.orange,
      errorColor: ColorsBase.red,
      focusColor: ColorsBase.yellow,
      inputDecorationTheme: TyxitInputDecoration.buildDark(textStyles),
      textSelectionTheme: TyxitTextSelection.buildDark(),
      disabledColor: ColorsBase.notSelected,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: ColorsBase.yellow,
        onPrimary: ColorsBase.white,
        secondary: ColorsBase.tangerine,
        onSecondary: ColorsBase.white,
        error: ColorsBase.red,
        onError: ColorsBase.white,
        background: ColorsBase.grey1,
        onBackground: ColorsBase.white,
        surface: ColorsBase.grey2,
        onSurface: ColorsBase.white,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsBase.yellow,
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: ColorsBase.yellow,
        disabledActiveTrackColor: ColorsBase.black,
        disabledInactiveTrackColor: ColorsBase.black,
        thumbColor: ColorsBase.white,
        inactiveTrackColor: ColorsBase.black,
        disabledThumbColor: ColorsBase.notSelected,
        trackHeight: 5,
        trackShape: RoundedRectSliderTrackShape(),
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 11,
          disabledThumbRadius: 11,
          elevation: 0,
          pressedElevation: 0,
        ),
      ),
    );
  }
}
