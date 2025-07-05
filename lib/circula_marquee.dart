import 'dart:math';
import 'package:flutter/material.dart';

class CircularMarquee extends StatefulWidget {
  final Widget child;
  final double radius;
  final Duration duration;

  const CircularMarquee({
    super.key,
    required this.child,
    this.radius = 100,
    this.duration = const Duration(seconds: 10)
  });

  @override
  State<CircularMarquee> createState() => _CircularMarqueeState();
}

class _CircularMarqueeState extends State<CircularMarquee>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _calculateOffset(double angle) {
    return Offset(
      widget.radius * cos(angle),
      widget.radius * sin(angle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        double angle = 2 * pi * _controller.value;
        Offset offset = _calculateOffset(angle);

        return Transform.translate(
          offset: offset,
          child: widget.child,
        );
      },
    );
  }
}
