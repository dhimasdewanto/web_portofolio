import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

import '../controllers/copy_text_state.dart';

class DoughWidget extends StatelessWidget {
  const DoughWidget({
    Key? key,
    this.useMouseRegion = true,
    required this.child,
  }) : super(key: key);

  /// Change cursor to text selection.
  final bool useMouseRegion;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isCopy = CopyTextState.of(context).isCopy;

    if (isCopy == false) {
      if (useMouseRegion == false) {
        return PressableDough(
          child: child,
        );
      }

      return MouseRegion(
        cursor: SystemMouseCursors.text,
        child: PressableDough(
          child: child,
        ),
      );
    }

    return SelectionArea(
      child: child,
    );
  }
}
