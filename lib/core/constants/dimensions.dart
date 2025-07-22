import 'package:flutter/material.dart';
import 'dart:math' as math;

class PortfolioSizes {
  // Reference dimensions — for MacBook Air-like layout
  static const double baseWidth = 1440.0;
  static const double baseHeight = 1024.0;

  // === SCALE FACTORS ===
  static double _widthFactor(BuildContext context) =>
      MediaQuery.of(context).size.width / baseWidth;

  static double _heightFactor(BuildContext context) =>
      MediaQuery.of(context).size.height / baseHeight;

  static double _scaleFactor(BuildContext context) =>
      math.min(_widthFactor(context), _heightFactor(context));

  static double _avgScale(BuildContext context) =>
      (_widthFactor(context) + _heightFactor(context)) / 2;

  // === FONTS ===
  static double fontXs(BuildContext context) => 12 * _scaleFactor(context);
  static double fontSm(BuildContext context) => 14 * _scaleFactor(context);
  static double fontMd(BuildContext context) => 18 * _scaleFactor(context);
  static double fontLg(BuildContext context) => 24 * _scaleFactor(context);
  static double fontXl(BuildContext context) => 32 * _scaleFactor(context);
  static double fontXxl(BuildContext context) => 40 * _scaleFactor(context);
  static double fontTitle(BuildContext context) => 56 * _scaleFactor(context);

  // === PADDING ===
  static EdgeInsets screenPadding(BuildContext context) => EdgeInsets.symmetric(
    horizontal: 32 * _widthFactor(context),
    vertical: 24 * _heightFactor(context),
  );

  static EdgeInsets sectionPadding(BuildContext context) =>
      EdgeInsets.symmetric(vertical: 80 * _heightFactor(context));

  static EdgeInsets horizontalPadding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: 24 * _widthFactor(context));

  static EdgeInsets verticalPadding(BuildContext context) =>
      EdgeInsets.symmetric(vertical: 24 * _heightFactor(context));

  static EdgeInsets cardPadding(BuildContext context) =>
      EdgeInsets.all(24 * _scaleFactor(context));

  static EdgeInsets chipPadding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: 12 * _widthFactor(context), vertical: 8);

  // === SPACING ===
  static double gapXs(BuildContext context) => 8 * _scaleFactor(context);
  static double gapSm(BuildContext context) => 12 * _scaleFactor(context);
  static double gapMd(BuildContext context) => 24 * _scaleFactor(context);
  static double gapLg(BuildContext context) => 48 * _scaleFactor(context);
  static double gapXl(BuildContext context) => 80 * _scaleFactor(context);
  static double gapXXl(BuildContext context) => 120 * _scaleFactor(context);

  // === AVATAR / IMAGE / THUMBS ===
  static double avatarSize(BuildContext context) => 120 * _scaleFactor(context);
  static double avatarBorder(BuildContext context) => 4 * _scaleFactor(context);
  static double imageThumb(BuildContext context) => 200 * _widthFactor(context);
  static double projectPreview(BuildContext context) => 300 * _widthFactor(context);

  // === BUTTON ===
  static double buttonHeight(BuildContext context) => 48 * _heightFactor(context);
  static double buttonWidth(BuildContext context) => 160 * _widthFactor(context);
  static double buttonRadius(BuildContext context) => 12 * _scaleFactor(context);
  static double buttonIconSize(BuildContext context) => 20 * _scaleFactor(context);
  static double buttonElevation(BuildContext context) => 4.0;

  // === CARD / CONTAINERS ===
  static double cardRadius(BuildContext context) => 16 * _scaleFactor(context);
  static double containerRadius(BuildContext context) => 24 * _scaleFactor(context);
  static double shadowBlur(BuildContext context) => 16 * _scaleFactor(context);
  static double borderStroke(BuildContext context) => 1.0;

  // === LIQUID / ANIMATIONS ===
  static double landingSlideHeight(BuildContext context) =>
      600 * _heightFactor(context);

  static double blobSize(BuildContext context) => 300 * _scaleFactor(context);
  static double blobPadding(BuildContext context) => 40 * _scaleFactor(context);
  static double overlayRevealOffset(BuildContext context) =>
      400 * _widthFactor(context);

  // === ICONS ===
  static double iconSm(BuildContext context) => 16 * _scaleFactor(context);
  static double iconMd(BuildContext context) => 24 * _scaleFactor(context);
  static double iconLg(BuildContext context) => 36 * _scaleFactor(context);

  // === DIVIDERS / LINES ===
  static double dividerHeight(BuildContext context) => 1 * _heightFactor(context);
  static double dividerThickness(BuildContext context) => 0.8 * _scaleFactor(context);

  // === INPUT FIELDS ===
  static double inputHeight(BuildContext context) => 52 * _heightFactor(context);
  static double inputRadius(BuildContext context) => 12 * _scaleFactor(context);
  static double inputFontSize(BuildContext context) => 16 * _scaleFactor(context);

  // === PROFILE MENU ===
  static double profileMenuItemHeight(BuildContext context) =>
      60 * _heightFactor(context);
  static double profileIconSize(BuildContext context) => 28 * _scaleFactor(context);
  static double profileSlideOffset(BuildContext context) =>
      300 * _widthFactor(context);

  // === DEVICE BREAKPOINTS ===
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static bool isUltraWide(BuildContext context) =>
      MediaQuery.of(context).size.width > 1920;
}
