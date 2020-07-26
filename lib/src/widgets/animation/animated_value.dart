import 'dart:ui';

import 'package:flutter/material.dart';

import 'implicit_animation_builder.dart';

class AnimatedValue extends StatelessWidget {
  final double value;
  final Duration duration;
  final Curve curve;
  final Widget Function(BuildContext context, double value) builder;
  const AnimatedValue({
    Key key,
    @required this.value,
    @required this.duration,
    this.curve = Curves.linear,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImplicitAnimationBuilder<double>(
      lerp: lerpDouble,
      value: value,
      curve: curve,
      duration: duration,
      builder: (context, value, _) => builder(context, value),
    );
  }
}
