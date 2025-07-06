import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const HoverCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  double height = 300.0;
  double width = 100.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        height = 340.0;
        width = 340.0;
      }),
      onExit: (_) => setState(() {
        height = 300.0;
        width = 100.0;
      }),
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10.0),
        duration: const Duration(milliseconds: 575),
        curve: Curves.easeOut,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.image),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: const LinearGradient(
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedRotation(
                duration: const Duration(milliseconds: 375),
                turns: height == 300.0 ? -1 / 4 : 0,
                curve: Curves.easeOut,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 375),
                  padding: EdgeInsets.symmetric(
                    vertical: height == 300.0 ? 20.0 : 0.0,
                  ),
                  child: Text(
                    widget.title,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                curve: Curves.easeOut,
                height: height == 300 ? 40.0 : 80.0,
                width: 320.0,
                color: Colors.transparent,
                padding: EdgeInsets.only(
                  top: height == 300 ? 100.0 : 20.0,
                ),
                clipBehavior: Clip.antiAlias,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 375),
                  opacity: height == 300 ? 0.0 : 1.0,
                  child: OverflowBox(
                    minWidth: 300.0,
                    minHeight: 80.0,
                    maxHeight: 100.0,
                    maxWidth: 320.0,
                    child: Text(
                      widget.description,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
