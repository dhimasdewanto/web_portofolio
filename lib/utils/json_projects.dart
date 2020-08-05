import 'package:flutter/widgets.dart';

import '../models/project_model.dart';
import '../settings/app_settings.dart';
import 'json_reader.dart';

class JsonProjects extends JsonReader {
  JsonProjects(BuildContext context) : super(context);

  Future<List<ProjectModel>> getJsonFile() async {
    final jsonMap = await readJsonFile(AppSettings.jsonSosmed);
    final listJsonSosmeds =
        jsonMap as List;
    return listJsonSosmeds
        .map((sosmed) => ProjectModel.fromJson(sosmed as Map<String, dynamic>))
        .toList();
  }
}