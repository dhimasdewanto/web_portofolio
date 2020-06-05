import 'package:flutter/material.dart';
import 'package:web_portofolio/models/profile_model.dart';
import 'package:web_portofolio/settings/app_settings.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        children: [
          Text(
            profile.name,
            textAlign: TextAlign.center,
            style: textTheme.headline2,
          ),
          const SizedBox(height: AppSettings.padding),
          ...profile.description.map((desc) {
            return Column(
              children: [
                const SizedBox(height: 10.0),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: textTheme.headline6,
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}