import 'package:flutter/material.dart';
import '../constants/dimensions.dart';

extension ResponsiveContext on BuildContext {
  // Font Sizes
  double get fontXs => PortfolioSizes.fontXs(this);
  double get fontSm => PortfolioSizes.fontSm(this);
  double get fontMd => PortfolioSizes.fontMd(this);
  double get fontLg => PortfolioSizes.fontLg(this);
  double get fontXl => PortfolioSizes.fontXl(this);
  double get fontXxl => PortfolioSizes.fontXxl(this);
  double get fontTitle => PortfolioSizes.fontTitle(this);

  // Gaps / Spacing
  double get gapXs => PortfolioSizes.gapXs(this);
  double get gapSm => PortfolioSizes.gapSm(this);
  double get gapMd => PortfolioSizes.gapMd(this);
  double get gapLg => PortfolioSizes.gapLg(this);
  double get gapXl => PortfolioSizes.gapXl(this);
  double get gapXXl => PortfolioSizes.gapXXl(this);

  // Padding
  EdgeInsets get screenPadding => PortfolioSizes.screenPadding(this);
  EdgeInsets get sectionPadding => PortfolioSizes.sectionPadding(this);
  EdgeInsets get horizontalPadding => PortfolioSizes.horizontalPadding(this);
  EdgeInsets get verticalPadding => PortfolioSizes.verticalPadding(this);
  EdgeInsets get cardPadding => PortfolioSizes.cardPadding(this);
  EdgeInsets get chipPadding => PortfolioSizes.chipPadding(this);

  // Avatar / Image / Thumbnails
  double get avatarSize => PortfolioSizes.avatarSize(this);
  double get avatarBorder => PortfolioSizes.avatarBorder(this);
  double get imageThumb => PortfolioSizes.imageThumb(this);
  double get projectPreview => PortfolioSizes.projectPreview(this);

  // Buttons
  double get buttonHeight => PortfolioSizes.buttonHeight(this);
  double get buttonWidth => PortfolioSizes.buttonWidth(this);
  double get buttonRadius => PortfolioSizes.buttonRadius(this);
  double get buttonIconSize => PortfolioSizes.buttonIconSize(this);
  double get buttonElevation => PortfolioSizes.buttonElevation(this);

  // Cards / Radius / Shadow
  double get cardRadius => PortfolioSizes.cardRadius(this);
  double get containerRadius => PortfolioSizes.containerRadius(this);
  double get shadowBlur => PortfolioSizes.shadowBlur(this);
  double get borderStroke => PortfolioSizes.borderStroke(this);

  // Animations
  double get landingSlideHeight => PortfolioSizes.landingSlideHeight(this);
  double get blobSize => PortfolioSizes.blobSize(this);
  double get blobPadding => PortfolioSizes.blobPadding(this);
  double get overlayRevealOffset => PortfolioSizes.overlayRevealOffset(this);

  // Icons
  double get iconSm => PortfolioSizes.iconSm(this);
  double get iconMd => PortfolioSizes.iconMd(this);
  double get iconLg => PortfolioSizes.iconLg(this);

  // Divider
  double get dividerHeight => PortfolioSizes.dividerHeight(this);
  double get dividerThickness => PortfolioSizes.dividerThickness(this);

  // Inputs
  double get inputHeight => PortfolioSizes.inputHeight(this);
  double get inputRadius => PortfolioSizes.inputRadius(this);
  double get inputFontSize => PortfolioSizes.inputFontSize(this);

  // Profile Menu
  double get profileMenuItemHeight => PortfolioSizes.profileMenuItemHeight(this);
  double get profileIconSize => PortfolioSizes.profileIconSize(this);
  double get profileSlideOffset => PortfolioSizes.profileSlideOffset(this);

  // Device Breakpoints
  bool get isMobile => PortfolioSizes.isMobile(this);
  bool get isTablet => PortfolioSizes.isTablet(this);
  bool get isDesktop => PortfolioSizes.isDesktop(this);
  bool get isUltraWide => PortfolioSizes.isUltraWide(this);
}
