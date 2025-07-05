import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class SkillMarquee extends StatelessWidget {
  final String text;
  final Color strokeColor;
  final double fontSize;
  final double velocity;
  final double strokeWidth;
  final double height;
  final TextDirection direction;

  const SkillMarquee({
    super.key,
    required this.text,
    this.strokeColor = Colors.red,
    this.fontSize = 48,
    this.velocity = 50.0,
    this.strokeWidth = 1.5,
    this.height = 50,
    this.direction = TextDirection.rtl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Marquee(
        text: text,
        style: TextStyle(
          fontFamily: 'HokyaaSans',
          fontSize: fontSize,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = strokeColor,
        ),
        scrollAxis: Axis.horizontal,
        blankSpace: 50.0,
        velocity: velocity,
        startPadding: 0.0,
        accelerationDuration: Duration.zero,
        decelerationDuration: Duration.zero,
        accelerationCurve: Curves.linear,
        decelerationCurve: Curves.linear,
        pauseAfterRound: Duration.zero,
      ),
    );
  }
}
