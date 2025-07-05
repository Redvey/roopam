import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (e) => setState(() => pointerOffset = e.localPosition),
      onExit: (e) => setState(() => pointerOffset = null),
      child: Stack(
        children: [
          widget.child, // ✅ Use the passed child instead of hardcoded layout
          if (pointerOffset != null) ...[
            AnimatedBuilder(
              animation: pointerSizeController,
              builder: (context, _) {
                return AnimatedPointer(
                  pointerOffset: pointerOffset!,
                  radius: 45 + 100 * pointerAnimation.value,
                );
              },
            ),
            AnimatedPointer(
              pointerOffset: pointerOffset!,
              movementDuration: const Duration(milliseconds: 200),
              radius: 10,
            ),
          ],
        ],
      ),
    );
  }

}

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key,
    required this.onLinkHovered,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  final Function(bool) onLinkHovered;
  final Color textColor;
  final Color backgroundColor;

  TextStyle get _defaultTextStyle => TextStyle(color: textColor);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello',
            style: _defaultTextStyle.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 20),
          Text('Check out this link:', style: _defaultTextStyle),
          const SizedBox(height: 30),
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onHover: onLinkHovered,
            mouseCursor: SystemMouseCursors.none,
            onTap: () {},
            child: Ink(
              child: Column(
                children: [
                  Text('See what happens', style: _defaultTextStyle),
                  const SizedBox(height: 7),
                  Container(color: textColor, width: 50, height: 2)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedPointer extends StatelessWidget {
  const AnimatedPointer({
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
      child: CustomPaint(
        painter: Pointer(radius),
      ),
    );
  }
}

class Pointer extends CustomPainter {
  final double radius;

  Pointer(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset.zero,
      radius,
      Paint()
        ..color = Colors.white
        ..blendMode = BlendMode.difference,
    );
  }

  @override
  bool shouldRepaint(covariant Pointer oldDelegate) {
    return oldDelegate.radius != radius;
  }
}
