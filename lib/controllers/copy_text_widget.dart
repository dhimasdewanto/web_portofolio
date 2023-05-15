import 'package:flutter/material.dart';

import 'copy_text_state.dart';

class CopyTextWidget extends StatefulWidget {
  const CopyTextWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<CopyTextWidget> createState() => _CopyTextWidgetState();
}

class _CopyTextWidgetState extends State<CopyTextWidget> {
  var _isCopy = false;

  void _onChange(bool isCopy) {
    setState(() {
      _isCopy = isCopy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CopyTextState(
      isCopy: _isCopy,
      onChange: _onChange,
      child: widget.child,
    );
  }
}
