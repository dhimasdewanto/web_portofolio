import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../route_builders/shared_axis_route_builder.dart';
import '../settings/data_list.dart';
import '../widgets/image_background.dart';
import '../widgets/profile_widget.dart';
import '../widgets/sosmed_widget.dart';
import '../widgets/unique_button.dart';
import 'projects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataList = DataList();
    final profile = dataList.getProfile();
    final listSosmeds = dataList.getSosmeds();
    final listProjects = dataList.getProjects();

    return Scaffold(
      body: Stack(
        children: [
          const ImageBackground(
            alignment: Alignment.centerRight,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileWidget(
                  profile: profile,
                ),
                const SizedBox(height: 30),
                SosmedWidget(
                  listSosmeds: listSosmeds,
                ),
                const SizedBox(height: 30),
                UniqueButton(
                  text: 'My Projects',
                  onPressed: () {
                    final route = SharedAxisRouteBuilder(
                      page: ProjectsPage(
                        listProjects: listProjects,
                      ),
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
