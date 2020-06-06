import 'package:flutter/material.dart';

class UniqueButton extends StatefulWidget {
  const UniqueButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  _UniqueButtonState createState() => _UniqueButtonState();
}

class _UniqueButtonState extends State<UniqueButton> {
  final _defaultRadius = BorderRadius.circular(10.0);
  final _changeRadius = BorderRadius.circular(10.0);

  final _defaultPadding = const EdgeInsets.symmetric(
    horizontal: 30.0,
    vertical: 15.0,
  );
  final _changePadding = const EdgeInsets.symmetric(
    horizontal: 40.0,
    vertical: 15.0,
  );

  BorderRadius _borderRadius;
  EdgeInsets _padding;

  @override
  void initState() {
    super.initState();
    _borderRadius = _defaultRadius;
    _padding = _defaultPadding;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: widget.onPressed,
      onHover: _changeBorderRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: _padding,
        decoration: BoxDecoration(
          color: textTheme.headline6.color,
          borderRadius: _borderRadius,
        ),
        child: Text(
          widget.text,
          style: textTheme.headline6.copyWith(
            color: theme.canvasColor,
          ),
        ),
      ),
    );
  }

  void _changeBorderRadius(bool isHover) {
    setState(() {
      if (isHover) {
        _borderRadius = _changeRadius;
        _padding = _changePadding;
      } else {
        _borderRadius = _defaultRadius;
        _padding = _defaultPadding;
      }
    });
  }
}
