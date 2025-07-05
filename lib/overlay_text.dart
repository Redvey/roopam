import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:roopam/home_view.dart';

class OverlayTextSection extends StatelessWidget {
  const OverlayTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          SizedBox(height: 100,),
          Column(
            children: [
              const _TitleText(
                text: 'I AM',
                style: TextStyle(
                  fontFamily: 'ScotchDisplay',
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _TitleText(
                    text: 'Roopam',
                    style: TextStyle(
                      fontFamily: 'ScotchDisplay',
                      fontStyle: FontStyle.normal,
                      fontSize: 100,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const _TitleText(
                    text: 'Barman',

                    style: TextStyle(
                      fontFamily: 'ScotchDisplay',
                      fontStyle: FontStyle.italic,
                      fontSize: 100,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            width: 470,
            child: Text(
              overlayDescriptionText,
              style: TextStyle(
                fontFamily: 'ScotchDisplay',
                fontStyle: FontStyle.normal,

                fontWeight: FontWeight.w400,
                color: Color(0xFFEC5001),
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            height: 40,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 7.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FlickerAnimatedText(
                    'Scroll to See magic',
                    textStyle: TextStyle(
                      fontFamily: 'HokyaaSans',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFF8E6CA),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const _TitleText({required this.text, this.style});

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
