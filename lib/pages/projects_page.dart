import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

import '../models/project_model.dart';
import '../utils/json_projects.dart';
import '../widgets/image_background.dart';
import '../widgets/projects_widget.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jsonProjects = JsonProjects(context).getJsonFile();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const MouseRegion(
          cursor: SystemMouseCursors.text,
          child: PressableDough(
            child: Text(
              "Back to Profile",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const ImageBackground(
            alignment: Alignment.center,
          ),
          FutureBuilder<List<ProjectModel>>(
            future: jsonProjects,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return const Offstage();
              }

              final listProjects = snapshot.data ?? [];
              return ProjectsWidget(
                listProjects: listProjects,
                title: Text(
                  "My Projects",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
