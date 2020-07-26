import 'package:flutter/material.dart';

import 'implicit_animation_builder.dart';

class AnimatedTranslation extends StatelessWidget {
  final Offset translation;
  final Duration duration;
  final Widget child;
  final Curve curve;
  final bool isFractional;
  const AnimatedTranslation({
    Key key,
    @required this.translation,
    @required this.duration,
    @required this.child,
    this.curve = Curves.linear,
    this.isFractional = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImplicitAnimationBuilder<Offset>(
      lerp: Offset.lerp,
      value: translation,
      curve: curve,
      duration: duration,
      builder: (context, value, _) {
        if (isFractional) {
          return FractionalTranslation(
            translation: value,
            child: child,
          );
        } else {
          return Transform.translate(
            child: child,
            offset: value,
          );
        }
      },
    );
  }
}
