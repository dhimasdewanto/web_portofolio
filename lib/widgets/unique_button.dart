import 'package:flutter/material.dart';
import 'package:web_portofolio/widgets/dough_widget.dart';

class UniqueButton extends StatefulWidget {
  const UniqueButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  State<UniqueButton> createState() => _UniqueButtonState();
}

class _UniqueButtonState extends State<UniqueButton> {
  final _defaultRadius = BorderRadius.circular(10);
  final _changeRadius = BorderRadius.circular(10);

  final _defaultPadding = const EdgeInsets.symmetric(
    horizontal: 30,
    vertical: 15,
  );
  final _changePadding = const EdgeInsets.symmetric(
    horizontal: 50,
    vertical: 15,
  );

  BorderRadius? _borderRadius;
  EdgeInsets? _padding;

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
    final headline6 = textTheme.titleLarge ?? const TextStyle();

    return DoughWidget(
      useMouseRegion: false,
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
            style: headline6.copyWith(
              color: theme.canvasColor,
            ),
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
