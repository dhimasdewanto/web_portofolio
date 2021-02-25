import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    Key? key,
    required this.alignment,
  }) : super(key: key);

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Opacity(
        opacity: 0.3,
        child: Image.asset("assets/images/Flutter Icon 1024.jpg"),
      ),
    );
  }
}
