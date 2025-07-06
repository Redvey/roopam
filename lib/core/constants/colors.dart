import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Greens
  static const greenDark = Color(0xFF36534A);
  static const greenDarker = Color(0xFF283127);
  static const greenSoft = Color(0xFF2C352B);
  static const greenLight = Color(0xFF3BFC67);
  static const greenMedium = Color(0xFF4CAF50);

  // Blues
  static const blue = Color(0xFF2196F3);

  // Reds
  static const red = Color(0xFFF44336);
  static const redDeep = Color(0xFFB00E2F);

  // Yellows & Oranges
  static const yellow = Color(0xFFFDF17D);
  static const orange = Color(0xFFEC5001);
  static const lightYellow = Color(0xFFE2DCC8);

  // Background & Neutrals
  static const lightBeige = Color(0xFFE2DCC8);
  static const textColor = Color(0xFF36534A);
  static const black = Color(0xFF1E1E1E);
}

class CustomColors {
  static Color primaryTextColor = Colors.white;
  static Color dividerColor = Colors.white54;
  static Color pageBackgroundColor = const Color(0xFF2E2F41);
  static Color menuBackgroundColor = const Color(0xFF242633);

  static Color clockBG = const Color(0xFF45465E);
  static Color clockOutline = const Color(0xFFEAECFF);
  static Color? secHandColor = const Color(0xFF71FFCF);
  static Color minHandStatColor = const Color(0xFF748EF6);
  static Color minHandEndColor = const Color(0xFF77DDFF);
  static Color hourHandStatColor = const Color(0xFFC279FB);
  static Color hourHandEndColor = const Color(0xFFEA74AB);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [const Color(0xFFFE6197), const Color(0xFFFFB463)];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}
