import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../models/profile_model.dart';
import '../models/sosmed_model.dart';
import '../route_builders/shared_axis_route_builder.dart';
import '../settings/app_settings.dart';
import '../utils/json_profile.dart';
import '../utils/json_sosmed.dart';
import '../widgets/profile_widget.dart';
import '../widgets/sosmed_widget.dart';
import '../widgets/unique_button.dart';
import 'projects_page.dart';

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
              onPressed: () {
                final route = SharedAxisRouteBuilder(
                  page: const ProjectsPage(),
                  transitionType: SharedAxisTransitionType.horizontal,
                );
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
