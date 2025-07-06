import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roopam/mini_apps/clock.dart';

import '../core/constants/colors.dart';
import 'models/app_model.dart';

List<AppModel> apps = [
  AppModel(
      title: "About",
      color: AppColors.redDeep,
      icon: CupertinoIcons.sportscourt_fill,
      screen:  Container()),
  AppModel(
      title: "Skills",
      color: AppColors.yellow,
      icon: CupertinoIcons.infinite,
      screen: Container()),
  AppModel(
      title: "LinkedIN",
      color: AppColors.blue,
      icon: CupertinoIcons.snow,
      screen: Container()),
  AppModel(
      title: "Github",
      color: AppColors.orange,
      icon: CupertinoIcons.gift,
      screen: Container()),
  AppModel(
      title: "Experience",
      color: AppColors.greenLight,
      icon: CupertinoIcons.briefcase_fill,
      screen: Container()),
  AppModel(
      title: "Resume",
      color: AppColors.lightYellow,
      icon: CupertinoIcons.book_circle_fill,
      screen: Container()),
  AppModel(
      title: "Education",
      color: AppColors.lightYellow,
      icon: Icons.school,
      screen: Container()),
  AppModel(title: "TicketX", color: AppColors.blue, icon: Icons.flutter_dash),
  AppModel(
      title: "Twitter",
      color: AppColors.blue,
      icon: CupertinoIcons.xmark,
      screen: Container()),
  AppModel(
      title: "Behance",
      color: AppColors.yellow,
      icon: CupertinoIcons.paintbrush_fill,
      screen: Container()),
  AppModel(
      title: "LinkTree",
      color: AppColors.greenLight,
      icon: CupertinoIcons.tree,
      screen: Container()),
  AppModel(
      title: "TicTac",
      color: AppColors.red,
      icon: CupertinoIcons.game_controller_solid,
      screen: Container()),
  AppModel(
      title: "Clocky",
      color: AppColors.red,
      icon: CupertinoIcons.game_controller_solid,
      screen: ClockApp()),
];