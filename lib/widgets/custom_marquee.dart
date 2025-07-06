
import 'dart:async';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

class CustomMarquee extends StatefulWidget {
  const CustomMarquee({
    super.key,
    required this.child,
    this.scrollAxis = Axis.horizontal,
    this.blankSpace = 20.0,
    this.velocity = 50.0,
    this.pauseAfterRound = Duration.zero,
    this.startPadding = 0.0,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.fadingEdgeStartFraction = 0.0,
    this.fadingEdgeEndFraction = 0.0,
    this.showFadingOnlyWhenScrolling = true,
  });

  final Widget child;
  final Axis scrollAxis;
  final double blankSpace;
  final double velocity;
  final Duration pauseAfterRound;
  final double startPadding;
  final CrossAxisAlignment crossAxisAlignment;
  final double fadingEdgeStartFraction;
  final double fadingEdgeEndFraction;
  final bool showFadingOnlyWhenScrolling;

  @override
  State<CustomMarquee> createState() => _CustomMarqueeState();
}

class _CustomMarqueeState extends State<CustomMarquee>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late double _scrollDistance;
  bool _running = true;
  bool _isOnPause = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() async {
    if (!_controller.hasClients) return;
    final size = context.size;
    if (size == null) return;

    _scrollDistance = size.width + widget.blankSpace;

    while (_running && mounted) {
      await _controller.animateTo(
        _scrollDistance,
        duration: Duration(
            milliseconds: (_scrollDistance / widget.velocity * 1000).toInt()),
        curve: Curves.linear,
      );

      if (!_running) break;

      if (widget.pauseAfterRound > Duration.zero) {
        setState(() => _isOnPause = true);
        await Future.delayed(widget.pauseAfterRound);
        if (!mounted) break;
        setState(() => _isOnPause = false);
      }

      _controller.jumpTo(widget.startPadding);
    }
  }

  @override
  void dispose() {
    _running = false;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget marquee = ListView.builder(
      controller: _controller,
      scrollDirection: widget.scrollAxis,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) => i.isEven
          ? Align(
        alignment: _crossAxisAlignmentToAlignment(),
        child: widget.child,
      )
          : _buildBlankSpace(),
    );

    return FadingEdgeScrollView.fromScrollView(
      gradientFractionOnStart:
      widget.showFadingOnlyWhenScrolling && !_isOnPause
          ? widget.fadingEdgeStartFraction
          : 0.0,
      gradientFractionOnEnd:
      widget.showFadingOnlyWhenScrolling && !_isOnPause
          ? widget.fadingEdgeEndFraction
          : 0.0,
      child: marquee as ScrollView,
    );
  }

  Alignment _crossAxisAlignmentToAlignment() {
    switch (widget.crossAxisAlignment) {
      case CrossAxisAlignment.start:
        return widget.scrollAxis == Axis.horizontal
            ? Alignment.topCenter
            : Alignment.centerLeft;
      case CrossAxisAlignment.end:
        return widget.scrollAxis == Axis.horizontal
            ? Alignment.bottomCenter
            : Alignment.centerRight;
      case CrossAxisAlignment.center:
      default:
        return Alignment.center;
    }
  }

  Widget _buildBlankSpace() {
    return SizedBox(
      width: widget.scrollAxis == Axis.horizontal ? widget.blankSpace : null,
      height: widget.scrollAxis == Axis.vertical ? widget.blankSpace : null,
    );
  }
}
