import 'package:flutter/material.dart';



class TitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TitleText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
      style ??
          const TextStyle(
            fontFamily: 'ScotchDisplay',
            fontSize: 200,
            fontWeight: FontWeight.w900,
            color: Color(0xFFEC5001),
          ),
    );
  }
}