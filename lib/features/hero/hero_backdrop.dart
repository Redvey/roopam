import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:roopam/core/constants/colors.dart';
import 'package:roopam/core/constants/strings.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.screenSize,
    required this.offScreenPercentage,
  });

  final Size screenSize;
  final double offScreenPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height - screenSize.height * 0.2 * offScreenPercentage,
      width: screenSize.width - screenSize.width * 0.5 * offScreenPercentage,
      decoration: BoxDecoration(color: AppColors.greenDarker),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.welcomeMessage.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.greenDark,
                    fontFamily: 'BebasNeue',
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(
                      3,
                      (index) =>
                          const Icon(Icons.star, color: AppColors.greenDark),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              AppStrings.codeDev.toUpperCase(),
              style: TextStyle(
                fontFamily: 'BebasNeue',
                color: Color(0xFF2C352B),
                fontSize: lerpDouble(240, 80, offScreenPercentage),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      3,
                      (index) => Icon(Icons.star, color: AppColors.greenDark),
                    ),
                  ],
                ),

                Text(
                  AppStrings.eleven.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    color: AppColors.greenDarkAccent,
                  ),
                ),
                Text(
                  AppStrings.equalPlus.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    color: AppColors.greenDarkAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
