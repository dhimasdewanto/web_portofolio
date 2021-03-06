import 'package:flutter/widgets.dart';

import '../models/profile_model.dart';
import '../settings/app_settings.dart';
import 'json_reader.dart';

class JsonProfile extends JsonReader<ProfileModel> {
  JsonProfile(BuildContext context) : super(context);

  @override
  Future<ProfileModel> getJsonFile() async {
    final jsonMap = await readJsonFile<Map>(AppSettings.jsonProfile);
    return ProfileModel.fromJson(jsonMap as Map<String, dynamic>);
  }
}