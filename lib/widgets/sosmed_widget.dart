import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/sosmed_model.dart';

class SosmedWidget extends StatelessWidget {
  const SosmedWidget({
    Key? key,
    required this.listSosmeds,
  }) : super(key: key);

  final List<SosmedModel> listSosmeds;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: listSosmeds.map((sosmed) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: PressableDough(
              child: TextButton.icon(
                icon: FaIcon(_getIcon(sosmed.iconName)),
                label: Text(sosmed.name),
                onPressed: () async {
                  await _lauchUrl(sosmed.link);
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _getIcon(String? iconName) {
    if (iconName == 'github') return FontAwesomeIcons.github;
    if (iconName == 'linkedin') return FontAwesomeIcons.linkedin;
    return FontAwesomeIcons.link;
  }

  Future<void> _lauchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
