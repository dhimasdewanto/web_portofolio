import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'copy_text_state.dart';

const _keyIsCopy = "is_copy";

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
  bool? _isCopy;

  @override
  void initState() {
    super.initState();

    /// Run after build.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initIsCopy();
    });
  }

  Future<void> _initIsCopy() async {
    final pref = await SharedPreferences.getInstance();
    final isCopyString = pref.getString(_keyIsCopy);
    final isCopy = isCopyString == "true" ? true : false;
    setState(() {
      _isCopy = isCopy;
    });
  }

  Future<void> _saveIsCopy(bool isCopy) async {
    final pref = await SharedPreferences.getInstance();
    final isCopyString = isCopy ? "true" : "false";
    await pref.setString(_keyIsCopy, isCopyString);
  }

  void _onChange(bool isCopy) {
    setState(() {
      _isCopy = isCopy;
    });

    _saveIsCopy(isCopy);
  }

  @override
  Widget build(BuildContext context) {
    final isCopy = _isCopy;
    if (isCopy == null) {
      return const SizedBox();
    }

    return CopyTextState(
      isCopy: isCopy,
      onChange: _onChange,
      child: widget.child,
    );
  }
}
