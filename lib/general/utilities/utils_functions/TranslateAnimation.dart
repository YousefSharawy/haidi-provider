
import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;


  const TranslateAnimation({Key? key, required this.child, this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration:duration?? const Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      builder: (_, double value, child) {
        return Transform.translate(
          offset: Offset(0, 100 * value),
          child: child,
        );
      },
      child: child,
    );
  }
}
