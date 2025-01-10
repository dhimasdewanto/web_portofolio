import 'package:flutter/widgets.dart';

import 'project_model_link.dart';

class ProjectModel {
  ProjectModel({
    required this.title,
    required this.description,
    required this.projectType,
    required this.images,
    required this.links,
    required this.appIcon,
  });

  final String title;
  final String description;
  final String projectType;
  final List<String> images;
  final List<ProjectModelLink> links;
  final Widget appIcon;
}
