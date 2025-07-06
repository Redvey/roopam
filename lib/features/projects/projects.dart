import 'package:flutter/material.dart';
import 'package:roopam/core/constants/colors.dart';

import '../../widgets/circular_object.dart';
import 'widgets/hover_card.dart';

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
      decoration: BoxDecoration(color: AppColors.lightBeige,),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Latest Projects",style: TextStyle(fontFamily: 'ScotchDisplay',fontSize: 64),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularMarquee(
                  child: Icon(Icons.sunny,size: 128,color: AppColors.blue,),
                ),
                HoverCard(
                  image: 'assets/images/footer.png',
                  title: 'Card Title 1',
                  description: 'This is a description.',
                ),
                HoverCard(
                  image: 'assets/images/abg.jpeg',
                  title: 'Card Title 2',
                  description: 'Another description.',
                ),
                HoverCard(
                  image: 'assets/images/footer.png',
                  title: 'Card Title 1',
                  description: 'This is a description.',
                ),
                HoverCard(
                  image: 'assets/images/abg.jpeg',
                  title: 'Card Title 2',
                  description: 'Another description.',
                ),
                HoverCard(
                  image: 'assets/images/footer.png',
                  title: 'Card Title 1',
                  description: 'This is a description.',
                ),
                CircularMarquee(
                  child: Icon(Icons.monetization_on,size: 128,color: Color(
                      0xF7FF7FFD),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("See All Projects",style: TextStyle(fontFamily: 'ScotchDisplay',fontSize: 24),),
                Icon(Icons.play_arrow_sharp)
              ],
            )
          ],
        ),
      ),
      // child: SizedBox(child: Image.network('https://ghchart.rshah.org/Redvey')),
    );
  }
}