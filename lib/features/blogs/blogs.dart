import 'package:flutter/material.dart';
import 'package:roopam/core/constants/colors.dart';
import 'package:roopam/features/blogs/widgets/skills_container.dart';

import '../../widgets/custom_marquee.dart';


class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key, required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: BoxDecoration(color: AppColors.black),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Tools I have worked with",
              style: TextStyle(
                fontFamily: 'ScotchDisplay',
                fontSize: 24,
                color: AppColors.lightYellow,
              ),
            ),
            Divider(),
            SizedBox(
              height: 100,
              width: screenSize.width,
              child: CustomMarquee(
                scrollAxis: Axis.horizontal,
                velocity: 30,
                blankSpace: 40,
                child: SkillsBox(assetName: 'assets/images/github-mark.svg', toolName: 'Github',),
              ),
            ),
            Text(
              "Blogs",
              style: TextStyle(
                fontFamily: 'ScotchDisplay',
                fontSize: 64,
                color: AppColors.lightYellow,
              ),
            ),
            Divider(),
          ],
        ),
      ),
      // child: SizedBox(child: Image.network('https://ghchart.rshah.org/Redvey')),
    );
  }
}
