import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../route_builders/shared_axis_route_builder.dart';
import '../settings/app_settings.dart';
import '../utils/json_profile_sosmed.dart';
import '../widgets/image_background.dart';
import '../widgets/profile_widget.dart';
import '../widgets/sosmed_widget.dart';
import '../widgets/unique_button.dart';
import 'projects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: JsonProfileSosmed(context).getJsonFile(),
        builder: (context, snapshot) {
          final profileSosmed = snapshot.data;
          if (profileSosmed == null) {
            return const SizedBox();
          }

          return Stack(
            children: [
              const ImageBackground(
                alignment: Alignment.centerRight,
              ),
              Padding(
                padding: const EdgeInsets.all(AppSettings.padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      profile: profileSosmed.profile,
                    ),
                    const SizedBox(height: AppSettings.padding),
                    SosmedWidget(
                      listSosmeds: profileSosmed.listSosmeds,
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
            ],
          );
        },
      ),
    );
  }
}
