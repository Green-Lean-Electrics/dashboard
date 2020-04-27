import 'dart:math' as math;
import 'package:dashboard/ui/shared/green_lean_icons.dart';
import 'package:flutter/material.dart';

class GreenLeanProgressIndicator extends StatefulWidget {
  final double size;

  GreenLeanProgressIndicator({this.size = 100});

  _GreenLeanProgressIndicatorState createState() => _GreenLeanProgressIndicatorState();
}

class _GreenLeanProgressIndicatorState extends State<GreenLeanProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotator;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _rotator = Tween(begin: math.pi * 2, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: _rotator.value,
        child: Icon(
          GreenLean.power,
          size: widget.size,
          color: Colors.white,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
