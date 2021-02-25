import 'package:flutter/widgets.dart';

import '../models/sosmed_model.dart';
import '../settings/app_settings.dart';
import 'json_reader.dart';

class JsonSosmed extends JsonReader<List<SosmedModel>> {
  JsonSosmed(BuildContext context) : super(context);

  @override
  Future<List<SosmedModel>> getJsonFile() async {
    final jsonMap = await readJsonFile<Map>(AppSettings.jsonSosmed) ?? {};
    final listJsonSosmeds = jsonMap['listSosmeds'] as List;
    return listJsonSosmeds
        .map((sosmed) => SosmedModel.fromJson(sosmed as Map<String, dynamic>))
        .toList();
  }
}
