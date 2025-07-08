import 'package:flutter/material.dart';
import 'package:roopam/core/constants/strings.dart';
import 'package:roopam/features/home/home_view.dart';
import 'package:roopam/features/overlay/widgets/title_text.dart';

import '../../widgets/flicker_text.dart';

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
          SizedBox(height: 100),
          Column(
            children: [
              const TitleText(
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
                  const TitleText(
                    text: 'Roopam',
                    style: TextStyle(
                      fontFamily: 'ScotchDisplay',
                      fontStyle: FontStyle.normal,
                      fontSize: 100,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const TitleText(
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

          SizedBox(height: 40, child: FlickerText(text: AppStrings.scrollHint)),
        ],
      ),
    );
  }
}
