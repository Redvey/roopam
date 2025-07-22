import 'dart:math';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:roopam/widgets/animated_cursor.dart';
import 'package:roopam/features/hero/hero_backdrop.dart';
import 'package:roopam/features/blogs/blogs.dart';
import 'package:roopam/features/contact/contact.dart';
import 'package:roopam/core/constants/colors.dart';
import 'package:roopam/features/projects/projects.dart';
import '../hero/widgets/background_marquee.dart';
import '../try_projects/mini_projects_page.dart';
import '../overlay/overlay_text.dart';




class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: AppColors.lightBeige,
      body: Stack(
        children: [
          BackdropArt(),

          //Main OPage
          CursorBlending(
            child: ScrollTransformView(
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
                    final bool startMovingImage =
                        scrollOffset >= screenSize.height * 0.8;
                    final double onScreenOffset =
                        scrollOffset + heightShrinkage / 2;
                    return Offset(
                      0,
                      !startMovingImage
                          ? onScreenOffset
                          : onScreenOffset -
                                (scrollOffset - screenSize.height * 0.8),
                    );
                  },
                ),

                //overlay text
                ScrollTransformItem(
                  builder: (double scrollOffset) {
                    return const OverlayTextSection();
                  },
                  offsetBuilder: (scrollOffset) =>
                      Offset(0, -screenSize.height),
                ),

                //bottom
                ScrollTransformItem(
                  builder: (double scrollOffset) {
                    return const BottomSection();
                  },
                ),

                ScrollTransformItem(
                  builder: (double scrollOffset) {
                    return  Projects(screenSize: screenSize);
                  },
                ),
                ScrollTransformItem(
                  builder: (double scrollOffset) {
                    return  BlogsPage(screenSize: screenSize);
                  },
                ),
                ScrollTransformItem(
                  builder: (double scrollOffset) {
                    return  ContactPage(screenSize: screenSize);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.pink,
        hoverColor: Colors.pink,
        child: Icon(Icons.download_rounded),
        onPressed: () {},
      ),
    );
  }
}





