import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'text_styles.dart';

class TyxitThemes {
  static ThemeData mainTheme() {
    return ThemeData(
        // Text
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: TextStyles.mainTextStyles(),

        // Colors
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: ColorsBase.yellow,
          secondary: ColorsBase.yellow,
          surface: ColorsBase.greyDark,
          background: ColorsBase.black,
          error: ColorsBase.red,
          onPrimary: ColorsBase.black,
          onSecondary: ColorsBase.white,
          onSurface: ColorsBase.white,
          onBackground: ColorsBase.black,
          onError: ColorsBase.white,
        ),
        scaffoldBackgroundColor: ColorsBase.black,
        backgroundColor: ColorsBase.grey,
        cardColor: ColorsBase.black);
  }
}
