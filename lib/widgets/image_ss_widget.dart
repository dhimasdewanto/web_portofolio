import 'package:flutter/material.dart';

/// Image screenshot widget.
/// 
/// When click image, show dialog to expand image.
class ImageSsWidget extends StatelessWidget {
  const ImageSsWidget({
    super.key,
    required this.imageLink,
  });

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return Dialog(
              child: Image.asset(imageLink),
            );
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imageLink,
          height: 500,
        ),
      ),
    );
  }
}
