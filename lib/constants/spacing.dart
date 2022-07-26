import 'package:flutter/material.dart';

class Spacing {
  // Base
  static const double tiny = 6;
  static const double small = 10;
  static const double medium = 20;
  static const double big = 40;
  static const double huge = 60;

  /* Layouts
   ********************************/

  // Containers
  static const EdgeInsets standardContainer = EdgeInsets.all(Spacing.medium);

  static const EdgeInsets fullWidthContainer = EdgeInsets.symmetric(
    horizontal: 0,
    vertical: medium,
  );

  static const EdgeInsets message = EdgeInsets.only(
    top: small,
    left: medium,
    right: medium,
    bottom: medium,
  );

  // Fields
  static const SizedBox betweenFields = SizedBox(height: Spacing.medium);
}
