import 'package:flutter/material.dart';
import 'dart:ui';

class CursorBlending extends StatefulWidget {
  final Widget child;
  const CursorBlending({super.key, required this.child});

  @override
  State<CursorBlending> createState() => _CursorBlendingState();
}

class _CursorBlendingState extends State<CursorBlending>
    with SingleTickerProviderStateMixin {
  Offset? pointerOffset;
  late AnimationController pointerSizeController;
  late Animation<double> pointerAnimation;

  @override
  void initState() {
    super.initState();
    pointerSizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    pointerAnimation = CurvedAnimation(
      parent: pointerSizeController,
      curve: Curves.easeInOutCubic,
    );
  }

  void togglePointerSize(bool hovering) {
    if (hovering) {
      pointerSizeController.forward();
    } else {
      pointerSizeController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (e) => setState(() => pointerOffset = e.localPosition),
      onExit: (e) => setState(() => pointerOffset = null),
      child: Stack(
        children: [
          widget.child,
          if (pointerOffset != null) ...[
            // Glass blur effect (larger cursor)
            AnimatedBuilder(
              animation: pointerSizeController,
              builder: (context, _) {
                return GlassPointer(
                  pointerOffset: pointerOffset!,
                  radius: 45 + 100 * pointerAnimation.value,
                  glassType: GlassType.blur, // Frosted glass effect
                );
              },
            ),
            // Small solid cursor
            GlassPointer(
              pointerOffset: pointerOffset!,
              movementDuration: const Duration(milliseconds: 200),
              radius: 10,
              glassType: GlassType.solid,
            ),
          ],
        ],
      ),
    );
  }
}

enum GlassType { blur, solid, border, gradient }

class GlassPointer extends StatelessWidget {
  const GlassPointer({
    super.key,
    required this.pointerOffset,
    this.movementDuration = const Duration(milliseconds: 700),
    this.radius = 30,
    this.glassType = GlassType.blur,
  });

  final Offset pointerOffset;
  final Duration movementDuration;
  final double radius;
  final GlassType glassType;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: movementDuration,
      curve: Curves.easeOutExpo,
      top: pointerOffset.dy - radius,
      left: pointerOffset.dx - radius,
      child: IgnorePointer(
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: _buildGlassEffect(),
        ),
      ),
    );
  }

  Widget _buildGlassEffect() {
    switch (glassType) {
      case GlassType.blur:
        return IgnorePointer(
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(51),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withAlpha(77),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        );

      case GlassType.solid:
        return IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(230),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(26),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        );

      case GlassType.border:
        return IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withAlpha(153),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(77),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
        );

      case GlassType.gradient:
        return IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.white.withAlpha(102),
                  Colors.white.withAlpha(26),
                  Colors.transparent,
                ],
              ),
              border: Border.all(
                color: Colors.white.withAlpha(128),
                width: 1,
              ),
            ),
          ),
        );
    }
  }
}

// Alternative: Custom Painter approach for more control
class CustomGlassPointer extends StatelessWidget {
  const CustomGlassPointer({
    super.key,
    required this.pointerOffset,
    this.movementDuration = const Duration(milliseconds: 700),
    this.radius = 30,
  });

  final Offset pointerOffset;
  final Duration movementDuration;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: movementDuration,
      curve: Curves.easeOutExpo,
      top: pointerOffset.dy,
      left: pointerOffset.dx,
      child: IgnorePointer(
        child: CustomPaint(
          painter: GlassPainter(radius),
        ),
      ),
    );
  }
}

class GlassPainter extends CustomPainter {
  final double radius;

  GlassPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    // Glass effect with gradient and blur
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withAlpha(77),
          Colors.white.withAlpha(25),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset.zero, radius: radius));

    // Draw main glass circle
    canvas.drawCircle(Offset.zero, radius, paint);

    // Draw border
    final borderPaint = Paint()
      ..color = Colors.white.withAlpha(102)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawCircle(Offset.zero, radius, borderPaint);

    // Optional: Add inner highlight
    final highlightPaint = Paint()
      ..color = Colors.white.withAlpha(153)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    canvas.drawCircle(
      Offset(-radius * 0.3, -radius * 0.3),
      radius * 0.3,
      highlightPaint,
    );
  }

  @override
  bool shouldRepaint(covariant GlassPainter oldDelegate) {
    return oldDelegate.radius != radius;
  }
}

