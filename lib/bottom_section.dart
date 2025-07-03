import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: const Color(0xffB10D31),
      child: Column(
        children: [
          Center(
            child: Text(
              'I GO EXPLORE\nAND MAKE THINGS\nTHAT I FIND INTERESTING',
              textAlign: TextAlign.center,
              style: GoogleFonts.biryani(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w800,
                height: 1.2,

              ),
            ),
          ),
        ],
      ),
    );
  }
}