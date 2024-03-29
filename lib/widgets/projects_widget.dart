import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project_model.dart';
import '../settings/app_settings.dart';
import 'tags_widget.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({
    Key? key,
    required this.title,
    required this.listProjects,
  }) : super(key: key);

  final Widget title;
  final List<ProjectModel> listProjects;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSettings.padding,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: listProjects.length + 1,
      itemBuilder: (context, index) {
        // Top of ListView.
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSettings.padding,
            ),
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.text,
                child: PressableDough(
                  child: title,
                ),
              ),
            ),
          );
        }

        // Get index -1 because of top ListView.
        final project = listProjects[index - 1];

        return PressableDough(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                project.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(project.name),
            subtitle: Text(project.description),
            trailing: TagsWidget(
              tags: project.tags,
            ),
            onTap: () => _lauchUrl(project.url),
          ),
        );
      },
    );
  }

  Future<void> _lauchUrl(String website) async {
    final url = Uri.parse(website);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
