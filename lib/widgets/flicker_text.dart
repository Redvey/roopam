import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:roopam/core/constants/colors.dart';



class FlickerText extends StatelessWidget {
  const FlickerText({
    super.key, required this.text, this.fontSize=20,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 35,
        color: AppColors.primaryWhite,
        shadows: [
          Shadow(
            blurRadius: 7.0,
            color: AppColors.primaryWhite,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          FlickerAnimatedText(
            text,
            textStyle: TextStyle(
              fontFamily: 'HokyaaSans',
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.flickerYellow,
            ),
          ),
        ],
      ),
    );
  }
}