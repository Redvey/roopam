import 'package:flutter/material.dart';
import 'package:roopam/core/constants/strings.dart';
import 'package:roopam/features/overlay/widgets/title_text.dart';

import '../../widgets/flicker_text.dart';

class OverlayTextSection extends StatefulWidget {
  const OverlayTextSection({super.key});

  @override
  State<OverlayTextSection> createState() => _OverlayTextSectionState();
}

class _OverlayTextSectionState extends State<OverlayTextSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;
  late Animation<double> _fadeAnimation4;

  @override
  void initState() {
    super.initState();

    // Create animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // Create staggered fade animations

    _fadeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    ));

    _fadeAnimation3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 0.8, curve: Curves.easeOut),
    ));

    _fadeAnimation4 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 100),

          // Animated "I AM" text
          FadeTransition(
            opacity: _fadeAnimation3,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
              )),
              child: Column(
                children: [
                  const TitleText(
                    text: 'I AM',
                    style: TextStyle(
                      fontFamily: 'ScotchDisplay',
                      fontStyle: FontStyle.italic,
                      fontSize: 24,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Animated name section
// Animated name section from left - SMOOTHER VERSION
          FadeTransition(
            opacity: _fadeAnimation2,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.2, 0), // Start further left for smoother entry
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.0, 0.8, curve: Curves.easeInOut), // Longer duration + smoother curve
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleText(
                    text: 'Roopam',
                    style: TextStyle(
                      fontFamily: 'ScotchDisplay',
                      fontStyle: FontStyle.normal,
                      fontSize: 100,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const TitleText(
                    text: 'Barman',
                    style: TextStyle(
                      fontFamily: 'ScotchDisplay',
                      fontStyle: FontStyle.italic,
                      fontSize: 100,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),


          // Animated description text
          FadeTransition(
            opacity: _fadeAnimation3,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.5, 0.8, curve: Curves.easeOut),
              )),
              child: SizedBox(
                width: 470,
                child: Text(
                  AppStrings.overlayDescriptionText,
                  style: const TextStyle(
                    fontFamily: 'ScotchDisplay',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFEC5001),
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // Animated flicker text
          FadeTransition(
            opacity: _fadeAnimation4,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
              )),
              child: SizedBox(
                height: 40,
                child: FlickerText(text: AppStrings.scrollHint),
              ),
            ),
          ),
    ],
      ),
    );
  }
}