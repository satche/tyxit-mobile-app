import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class TextStyleBase {
  static TextTheme baseTextTheme() {
    return TextTheme(
      headline1: _h1,
      headline2: _h2,
      headline3: _h3,
      headline4: _h4,
      headline5: _medium,
      bodyText1: _normal14,
      bodyText2: _normal12,
      caption: _chatDetails,
    );
  }

  static TextStyle get baseTextStyle => GoogleFonts.roboto();

  static TextStyle get _h1 => baseTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 34,
        height: 1.18,
      );

  static TextStyle get _bigHeading => baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        height: 1.33,
      );

  static TextStyle get _h2 => baseTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        height: 1.23,
      );

  static TextStyle get _chatDetails {
    return baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 8,
      height: 1.5,
    );
  }

  static TextStyle get _normal12 {
    return baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 2,
    );
  }

  static TextStyle get _system12 {
    return baseTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.16,
    );
  }

  static TextStyle get _normal14 {
    return baseTextStyle.copyWith(
      // normal 1
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.71,
    );
  }

  static TextStyle get _medium {
    return baseTextStyle.copyWith(
      // medium
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.5,
    );
  }

  static TextStyle get _h4 {
    return baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 1.33,
    );
  }

  static TextStyle get _h3 {
    return baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1.09,
    );
  }

  static TextStyle get _label18 {
    return baseTextStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      height: 1.33,
    );
  }

  static TyxitTextStyles textStyles() {
    return TyxitTextStyles(
      h1: _h1,
      bigHeading: _bigHeading,
      h2: _h2,
      h3: _h3,
      h4: _h4,
      medium: _medium,
      normal14: _normal14,
      normal12: _normal12,
      chatDetails: _chatDetails,
      label18: _label18,
      system12: _system12,
    );
  }
}

@immutable
class TyxitTextStyles extends ThemeExtension<TyxitTextStyles> {
  const TyxitTextStyles({
    required this.h1,
    required this.bigHeading,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.label18,
    required this.medium,
    required this.normal14,
    required this.normal12,
    required this.chatDetails,
    required this.system12,
  });

  final TextStyle h1;
  final TextStyle bigHeading;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle label18;
  final TextStyle medium;
  final TextStyle normal14;
  final TextStyle normal12;
  final TextStyle system12;
  final TextStyle chatDetails;

  static TyxitTextStyles of(BuildContext context) =>
      Theme.of(context).extension<TyxitTextStyles>()!;

  @override
  ThemeExtension<TyxitTextStyles> copyWith({
    TextStyle? h1,
    TextStyle? bigHeading,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? medium,
    TextStyle? normal14,
    TextStyle? normal12,
    TextStyle? system12,
    TextStyle? chatDetails,
    TextStyle? label18,
  }) {
    return TyxitTextStyles(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      medium: medium ?? this.medium,
      normal14: normal14 ?? this.normal14,
      normal12: normal12 ?? this.normal12,
      chatDetails: chatDetails ?? this.chatDetails,
      label18: label18 ?? this.label18,
      system12: system12 ?? this.system12,
      bigHeading: bigHeading ?? this.bigHeading,
    );
  }

  @override
  ThemeExtension<TyxitTextStyles> lerp(
    ThemeExtension<TyxitTextStyles>? other,
    double t,
  ) {
    if (other is! TyxitTextStyles) {
      return this;
    }

    return copyWith(
      h1: TextStyle.lerp(h1, other.h1, t),
      h2: TextStyle.lerp(h2, other.h2, t),
      h3: TextStyle.lerp(h3, other.h3, t),
      h4: TextStyle.lerp(h4, other.h4, t),
      label18: TextStyle.lerp(label18, other.label18, t),
      medium: TextStyle.lerp(medium, other.medium, t),
      normal14: TextStyle.lerp(normal14, other.normal14, t),
      normal12: TextStyle.lerp(normal12, other.normal12, t),
      chatDetails: TextStyle.lerp(chatDetails, other.chatDetails, t),
      system12: TextStyle.lerp(system12, other.system12, t),
      bigHeading: TextStyle.lerp(bigHeading, other.bigHeading, t),
    );
  }
}

extension TextStyleExtensions on TextStyle {
  TextStyle textGrey(BuildContext context) => copyWith(
        color: TyxitColors.of(context).textGrey,
      );

  TextStyle notSelected(BuildContext context) => copyWith(
        color: TyxitColors.of(context).notSelected,
      );

  TextStyle tangerine(BuildContext context) => copyWith(
        color: TyxitColors.of(context).tangerine,
      );
}
