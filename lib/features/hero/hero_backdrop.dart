import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roopam/core/constants/colors.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.screenSize,
    required this.offScreenPercentage,
  });

  final Size screenSize;
  final double offScreenPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height - screenSize.height * 0.2 * offScreenPercentage,
      width: screenSize.width - screenSize.width * 0.5 * offScreenPercentage,
      decoration: BoxDecoration(
        color: AppColors.greenDarker,
        // image: DecorationImage(
        //   image: AssetImage('assets/images/bg.png'),
        //   fit: BoxFit.cover, // You can change this to BoxFit.fill, BoxFit.contain, etc.
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome To ROOPFOLIO".toUpperCase(),
                  style: GoogleFonts.bebasNeue(color: Color(0xFF36534A)),
                ),
                Row(
                  children: [
                    ...List.generate(
                      3,
                          (index) =>
                      const Icon(Icons.star, color: Color(0xFF36534A)),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Code+Dev".toUpperCase(),
              style: GoogleFonts.bebasNeue(
                color: Color(0xFF2C352B),
                fontSize: 240,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      3,
                          (index) =>
                      const Icon(Icons.star, color: Color(0xFF36534A)),
                    ),
                  ],
                ),

                Text(
                  "11:11".toUpperCase(),
                  style: GoogleFonts.bebasNeue(color: Color(0xEC36534A)),
                ),
                Text(
                  "=====+=-+=====".toUpperCase(),
                  style: GoogleFonts.bebasNeue(color: Color(0xEC36534A)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
