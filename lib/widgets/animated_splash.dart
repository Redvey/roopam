import 'package:flutter/material.dart';
import 'package:roopam/core/constants/colors.dart';
import '../features/home/home_view.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({super.key});

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash>
    with TickerProviderStateMixin {
  late AnimationController _lightGreenController;
  late Animation<double> _lightGreenAnim;

  late AnimationController _homeViewController;
  late Animation<double> _homeViewAnim;

  @override
  void initState() {
    super.initState();

    _lightGreenController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _homeViewController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _lightGreenAnim = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _lightGreenController, curve: Curves.easeInOut),
    );

    _homeViewAnim = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: _homeViewController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lightGreenController.forward();
      Future.delayed(const Duration(milliseconds: 600), () {
        _homeViewController.forward(); // Start HomeView while light green still moving
      });
    });
  }

  @override
  void dispose() {
    _lightGreenController.dispose();
    _homeViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.greenDark, // Orange background
      body: Stack(
        children: [
          // HomeView sliding in from top
          AnimatedBuilder(
            animation: _homeViewController,
            builder: (context, child) {
              return Positioned(
                top: _homeViewAnim.value * screenHeight,
                left: 0,
                right: 0,
                height: screenHeight,
                child: child!,
              );
            },
            child: const HomeView(),
          ),

          // Light green screen sliding down
          AnimatedBuilder(
            animation: _lightGreenController,
            builder: (context, child) {
              return Positioned(
                top: _lightGreenAnim.value * screenHeight,
                left: 0,
                right: 0,
                height: screenHeight,
                child: child!,
              );
            },
            child: Container(
              color: AppColors.orange,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
