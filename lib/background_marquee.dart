import 'package:flutter/material.dart';
import 'package:roopam/skill_marquee.dart';

class BackdropArt extends StatelessWidget {
  const BackdropArt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SkillMarquee(
            text: "* Made with Flutter <3 *",
            direction: TextDirection.ltr,
            velocity: 70,
          ),

          SkillMarquee(
            text: "* Hire Me *",
            strokeColor: Colors.blue,
            velocity: 120,
            direction: TextDirection.rtl,
          ),
          SkillMarquee(
            text: "* Isn't it Awesome? *",
            strokeColor: Colors.green,
            direction: TextDirection.ltr,
            velocity: 70,
          ),
        ],
      ),
    );
  }
}