import 'package:flutter/widgets.dart';
import 'package:web_portofolio/models/sosmed_model.dart';
import 'package:web_portofolio/settings/app_settings.dart';

import 'json_reader.dart';

class JsonSosmed extends JsonReader {
  JsonSosmed(BuildContext context) : super(context);

  Future<List<SosmedModel>> getJsonFile() async {
    final jsonMap = await readJsonFile<Map>(AppSettings.jsonSosmed);
    final listJsonSosmeds =
        jsonMap['listSosmeds'] as List;
    return listJsonSosmeds
        .map((sosmed) => SosmedModel.fromJson(sosmed as Map<String, dynamic>))
        .toList();
  }
}
