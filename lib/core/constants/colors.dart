import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //Primary Black and Whites
  static const primaryWhite = Color(0xFFFFFFFF);
  static const primaryBlack = Color(0xFF000000);

  // Greens
  static const greenDark = Color(0xFF36534A);
  static const greenDarkAccent = Color(0xEC36534A);
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
  static const flickerYellow = Color(0xFFF8E6CA);

  // Background & Neutrals
  static const lightBeige = Color(0xFFE2DCC8);
  static const textColor = Color(0xFF36534A);
  static const black = Color(0xFF1E1E1E);


  //Mini-App Colors
  static const primaryTextColor = Colors.white;
  static const dividerColor = Colors.white54;
  static const pageBackgroundColor = Color(0xFF2E2F41);
  static const menuBackgroundColor = Color(0xFF242633);

  static const clockBG = Color(0xFF45465E);
  static const clockOutline = Color(0xFFEAECFF);
  static const secHandColor = Color(0xFF71FFCF);
  static const minHandStatColor = Color(0xFF748EF6);
  static const minHandEndColor = Color(0xFF77DDFF);
  static const hourHandStatColor = Color(0xFFC279FB);
  static const hourHandEndColor = Color(0xFFEA74AB);


  // Gradient Templates
  static const List<List<Color>> gradientTemplate = [
    [Color(0xFF6448FE), Color(0xFF5FC6FF)], // sky
    [Color(0xFFFE6197), Color(0xFFFFB463)], // sunset
    [Color(0xFF61A3FE), Color(0xFF63FFD5)], // sea
    [Color(0xFFFFA738), Color(0xFFFFE130)], // mango
    [Color(0xFFFF5DCD), Color(0xFFFF8484)], // fire
  ];

  static const blogGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF262626),
      Color(0xFF333333),
      Color(0xFF3F3F3F),
      Color(0xFF5E5E5E),
      Color(0xFF8C8C8C),
    ],
    stops: [
      0.34, // 34%
      0.74, // 74%
      0.85, // 85%
      1.0, // 100%
      1.0, // 100% (repeated for smooth blend)
    ],
  );

}






