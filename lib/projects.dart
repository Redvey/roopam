import 'package:flutter/material.dart';
import 'package:roopam/project_container.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Projects",style: TextStyle(fontFamily: 'ScotchDisplay',fontSize: 64),),
            ProjectBox(),
          ],
        ),
      ),
      // child: SizedBox(child: Image.network('https://ghchart.rshah.org/Redvey')),
    );
  }
}