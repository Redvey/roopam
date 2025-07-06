import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roopam/core/constants/colors.dart';

class SkillsBox extends StatelessWidget {
  final String assetName;
  final String toolName;
  const SkillsBox({
    super.key, required this.assetName, required this.toolName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,

      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Center(
          child: Row(
            children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
              assetName,),
            ),
              SizedBox(width: 5,),
              Text(toolName,style: TextStyle(color: AppColors.yellow),)
            ],
          ),
        ),
      ),
    );
  }
}