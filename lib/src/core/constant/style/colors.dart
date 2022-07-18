import 'package:flutter/material.dart';

class ColorsBase {
  static const tangerine = Color(0xffFAA41A);
  static const yellow = Color(0xffFAA603);
  static const orange = Color(0xffF15D22);
  static const violet = Color(0xffFAA603);
  static const white = Color(0xffFCFCFC);
  static const black = Color(0xff020202);
  static const red = Color(0xff9F0000);
  static const green = Color(0xff4ABA22);
  static const grey1 = Color(0xff0B0D10);
  static const grey2 = Color(0xff13161A);
  static const grey3 = Color(0xff1F2225);
  static const hoverGrey = Color(0xff2F3135);
  static const textGrey = Color(0xff77797B);
  static const notSelected = Color(0xff4E5055);

  static TyxitColors buildDark() {
    return const TyxitColors(
      yellow: yellow,
      orange: orange,
      violet: violet,
      white: white,
      black: black,
      red: red,
      green: green,
      grey1: grey1,
      grey2: grey2,
      grey3: grey3,
      hoverGrey: hoverGrey,
      textGrey: textGrey,
      notSelected: notSelected,
      tangerine: tangerine,
    );
  }
}

@immutable
class TyxitColors extends ThemeExtension<TyxitColors> {
  const TyxitColors({
    required this.yellow,
    required this.orange,
    required this.violet,
    required this.white,
    required this.black,
    required this.red,
    required this.green,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.hoverGrey,
    required this.textGrey,
    required this.notSelected,
    required this.tangerine,
  });

  final Color yellow;
  final Color orange;
  final Color violet;
  final Color white;
  final Color black;
  final Color red;
  final Color green;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final Color hoverGrey;
  final Color textGrey;
  final Color notSelected;
  final Color tangerine;

  Color get white5 => white.withOpacity(0.05);

  Color get white10 => white.withOpacity(0.1);

  Color get white20 => white.withOpacity(0.2);

  static TyxitColors of(BuildContext context) =>
      Theme.of(context).extension<TyxitColors>()!;

  @override
  ThemeExtension<TyxitColors> copyWith({
    Color? yellow,
    Color? orange,
    Color? violet,
    Color? white,
    Color? black,
    Color? red,
    Color? green,
    Color? grey1,
    Color? grey2,
    Color? grey3,
    Color? hoverGrey,
    Color? textGrey,
    Color? notSelected,
    Color? tangerine,
  }) {
    return TyxitColors(
      yellow: yellow ?? this.yellow,
      orange: orange ?? this.orange,
      violet: violet ?? this.violet,
      white: white ?? this.white,
      black: black ?? this.black,
      red: red ?? this.red,
      green: green ?? this.green,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      grey3: grey3 ?? this.grey3,
      hoverGrey: hoverGrey ?? this.hoverGrey,
      textGrey: textGrey ?? this.textGrey,
      notSelected: notSelected ?? this.notSelected,
      tangerine: tangerine ?? this.tangerine,
    );
  }

  @override
  ThemeExtension<TyxitColors> lerp(
    ThemeExtension<TyxitColors>? other,
    double t,
  ) {
    if (other == null || other is! TyxitColors) {
      return this;
    }

    return TyxitColors(
      yellow: Color.lerp(yellow, other.yellow, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      violet: Color.lerp(violet, other.violet, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      red: Color.lerp(red, other.red, t)!,
      green: Color.lerp(green, other.green, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      hoverGrey: Color.lerp(hoverGrey, other.hoverGrey, t)!,
      textGrey: Color.lerp(textGrey, other.textGrey, t)!,
      notSelected: Color.lerp(notSelected, other.notSelected, t)!,
      tangerine: Color.lerp(tangerine, other.tangerine, t)!,
    );
  }
}
