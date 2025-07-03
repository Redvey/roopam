import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home_view_widgets.dart';

const overlayDescriptionText =
    'I have to write some stuff to put in here so that it looks like there\'s something real written here. So lets write some real stuff here. A few weeks ago I concluded the biggest failure of my career. I founded a new startup and poured all my money and energy into it and it failed. The reasons for failure are clear and if you\'d like to hear I can make a video about that. For now that\'s all that I\'ll say.';
const backgroundImageUrl = 'assets/images/bg.jpg';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFEE5CA),
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (double scrollOffset) {
              final offScreenPercentage = min(scrollOffset/screenSize.height,1.0);
              return Image.asset(
                height: screenSize.height - screenSize.height*0.2*offScreenPercentage,
                width: screenSize.width - screenSize.width*0.5*offScreenPercentage,
                backgroundImageUrl,
                fit: BoxFit.cover,
              );

            },

            offsetBuilder: (scrollOffset){
              final offScreenPercentage = min(scrollOffset/screenSize.height,1.0);
              final heightShrinkage = screenSize.height*0.2*offScreenPercentage;
              final bool startMovingImage=scrollOffset>=screenSize.height;
              final double onScreenOffset=scrollOffset+heightShrinkage/2;
              return Offset(0,!startMovingImage?onScreenOffset: onScreenOffset-screenSize.height);
            }
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) {

              return const OverlayTextSection();
            },
            offsetBuilder: (scrollOffset)=>Offset(0,-screenSize.height),
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
