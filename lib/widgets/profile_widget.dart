import 'package:flutter/material.dart';

import '../models/profile_model.dart';
import '../settings/app_settings.dart';
import 'text_pressable_dough.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.profile,
  });

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        children: [
          TextPressableDough(
            child: Text(
              profile.name,
              textAlign: TextAlign.center,
              style: textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: AppSettings.padding),
          ...profile.description.map((desc) {
            return TextPressableDough(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
