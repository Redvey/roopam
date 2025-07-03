import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:roopam/backdrop.dart';
import 'bottom_section.dart';
import 'overlay_text.dart';

const overlayDescriptionText =
    'REACH YOUR OBJECTIVES MORE SAIFTLY AND EFFECTIVELY.';
const backgroundImageUrl = 'assets/images/bg.jpg';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xFFE2DCC8),
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (double scrollOffset) {
              final offScreenPercentage = min(
                scrollOffset / screenSize.height,
                1.0,
              );
              return HomeTitle(
                screenSize: screenSize,
                offScreenPercentage: offScreenPercentage,
              );
            },
            offsetBuilder: (scrollOffset) {
              final offScreenPercentage = min(
                scrollOffset / screenSize.height,
                1.0,
              );
              final heightShrinkage =
                  screenSize.height * 0.2 * offScreenPercentage;
              final bool startMovingImage = scrollOffset >= screenSize.height*0.8;
              final double onScreenOffset = scrollOffset + heightShrinkage / 2;
              return Offset(
                0,
                !startMovingImage
                    ? onScreenOffset
                    : onScreenOffset - (scrollOffset-screenSize.height*0.8),
              );
            },
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) {
              return const OverlayTextSection();
            },
            offsetBuilder: (scrollOffset) => Offset(0, -screenSize.height),
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) {
              return const BottomSection();
            },
          ),
        ],
      ),
    );
  }
}
