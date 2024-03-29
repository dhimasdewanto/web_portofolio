import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final textColor =
        (Theme.of(context).textTheme.bodyLarge ?? const TextStyle()).color;
    final canvasColor = Theme.of(context).canvasColor;

    return Wrap(
      spacing: 5,
      children: tags.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: textColor,
          ),
          child: Text(
            tag,
            style: TextStyle(
              color: canvasColor,
            ),
          ),
        );
      }).toList(),
    );
  }
}
