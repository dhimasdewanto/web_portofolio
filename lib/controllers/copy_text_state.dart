import 'package:flutter/material.dart';

class CopyTextState extends InheritedWidget {
  const CopyTextState({
    super.key,
    required this.isCopy,
    required this.onChange,
    required super.child,
  });

  final bool isCopy;
  final void Function(bool isCopy) onChange;

  static CopyTextState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<CopyTextState>();
    assert(result != null, 'No CopyTextState found in context');
    return result!;
  }

  static CopyTextState? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CopyTextState>();
  }

  @override
  bool updateShouldNotify(CopyTextState oldWidget) =>
      isCopy != oldWidget.isCopy;
}
