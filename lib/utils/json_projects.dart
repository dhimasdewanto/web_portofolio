import 'package:flutter/widgets.dart';

import '../models/project_model.dart';
import '../settings/app_settings.dart';
import 'json_reader.dart';

class JsonProjects extends JsonReader<List<ProjectModel>> {
  JsonProjects(BuildContext context) : super(context);

  @override
  Future<List<ProjectModel>> getJsonFile() async {
    final listJsonProjects = await readJsonFile<List>(AppSettings.jsonProjects);
    return listJsonProjects
        .map((sosmed) => ProjectModel.fromJson(sosmed as Map<String, dynamic>))
        .toList();
  }
}