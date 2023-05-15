import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

import '../controllers/copy_text_state.dart';
import '../models/profile_model.dart';
import '../settings/app_settings.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isCopy = CopyTextState.of(context).isCopy;

    return Center(
      child: Column(
        children: [
          if (isCopy == true) ...{
            SelectionArea(
              child: Text(
                profile.name,
                textAlign: TextAlign.center,
                style: textTheme.displayMedium,
              ),
            ),
          } else ...{
            MouseRegion(
              cursor: SystemMouseCursors.text,
              child: PressableDough(
                child: Text(
                  profile.name,
                  textAlign: TextAlign.center,
                  style: textTheme.displayMedium,
                ),
              ),
            ),
          },
          const SizedBox(height: AppSettings.padding),
          ...profile.description.map((desc) {
            if (isCopy == true) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  SelectionArea(
                    child: Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge,
                    ),
                  ),
                ],
              );
            }

            return MouseRegion(
              cursor: SystemMouseCursors.text,
              child: PressableDough(
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
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
