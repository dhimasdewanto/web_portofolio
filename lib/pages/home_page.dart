import 'package:flutter/material.dart';
import 'package:web_portofolio/models/sosmed_model.dart';
import 'package:web_portofolio/settings/app_settings.dart';
import 'package:web_portofolio/utils/json_sosmed.dart';
import 'package:web_portofolio/widgets/unique_button.dart';
import 'package:web_portofolio/widgets/profile_widget.dart';
import 'package:web_portofolio/widgets/sosmed_widget.dart';

import '../models/profile_model.dart';
import '../utils/json_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jsonProfile = JsonProfile(context).getJsonFile();
    final jsonSosmed = JsonSosmed(context).getJsonFile();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSettings.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<ProfileModel>(
              future: jsonProfile,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Offstage();
                return ProfileWidget(
                  profile: snapshot.data,
                );
              },
            ),
            const SizedBox(height: AppSettings.padding),
            FutureBuilder<List<SosmedModel>>(
              future: jsonSosmed,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Offstage();
                return SosmedWidget(
                  listSosmeds: snapshot.data,
                );
              },
            ),
            const SizedBox(height: AppSettings.padding),
            UniqueButton(
              text: 'My Projects',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
