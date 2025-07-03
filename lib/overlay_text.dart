import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roopam/home_view.dart';




class OverlayTextSection extends StatelessWidget {
  const OverlayTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        children: [
          const _TitleText(
            text: 'SHARE',
            top: 100,
            left: 50,
          ),
          const _TitleText(
            text: 'THE',
            top: 260,
            left: 290,
          ),
          const _TitleText(
            text: 'VIDEO',
            top: 420,
            left: 220,
          ),
          Positioned(
            right: 50,
            top: 170,
            child: SizedBox(
              width: 470,
              child: Text(
                overlayDescriptionText,
                style: TextStyle(color: Color(0xFFEC5001), fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final double? top;
  final double? left;
  final String text;
  const _TitleText({
    required this.text,
    this.top,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Text(
          text,
          style: GoogleFonts.fascinate(
              fontSize: 200, fontWeight: FontWeight.w900, color: Color(0xFFEC5001)),
        ));
  }
}