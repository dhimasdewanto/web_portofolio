import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

class UniqueButton extends StatefulWidget {
  const UniqueButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 15,
    ),
    this.onHoverPadding = const EdgeInsets.symmetric(
      horizontal: 50,
      vertical: 15,
    ),
  });

  final String text;
  final void Function() onPressed;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry onHoverPadding;

  @override
  State<UniqueButton> createState() => _UniqueButtonState();
}

class _UniqueButtonState extends State<UniqueButton> {
  final _defaultRadius = BorderRadius.circular(10);
  final _changeRadius = BorderRadius.circular(10);

  BorderRadius? _borderRadius;
  EdgeInsetsGeometry? _padding;

  @override
  void initState() {
    super.initState();
    _borderRadius = _defaultRadius;
    _padding = widget.padding;
  }

  void _changeBorderRadius(bool isHover) {
    setState(() {
      if (isHover) {
        _borderRadius = _changeRadius;
        _padding = widget.onHoverPadding;
      } else {
        _borderRadius = _defaultRadius;
        _padding = widget.padding;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final headline6 = textTheme.titleLarge ?? const TextStyle();
    final textStyle = widget.textStyle ?? headline6;

    return PressableDough(
      child: InkWell(
        onTap: widget.onPressed,
        onHover: _changeBorderRadius,
        child: AnimatedContainer(
          curve: Curves.bounceOut,
          duration: const Duration(milliseconds: 500),
          padding: _padding,
          decoration: BoxDecoration(
            color: headline6.color,
            borderRadius: _borderRadius,
          ),
          child: Text(
            widget.text,
            style: textStyle.copyWith(
              color: theme.scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
