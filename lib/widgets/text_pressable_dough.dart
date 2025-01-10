import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

/// [PressableDough] with [MouseRegion].
class TextPressableDough extends StatelessWidget {
  const TextPressableDough({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.text,
      child: PressableDough(child: child),
    );
  }
}
