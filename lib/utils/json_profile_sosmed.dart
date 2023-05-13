import 'package:flutter/widgets.dart';

import '../models/profile_model.dart';
import '../models/profile_sosmed_model.dart';
import '../models/sosmed_model.dart';
import 'json_profile.dart';
import 'json_reader.dart';
import 'json_sosmed.dart';

class JsonProfileSosmed extends JsonReader<ProfileSosmedModel?> {
  JsonProfileSosmed(BuildContext context) : super(context);

  @override
  Future<ProfileSosmedModel?> getJsonFile() async {
    final results = await Future.wait([
      JsonProfile(context).getJsonFile(),
      JsonSosmed(context).getJsonFile(),
    ]);

    final profileRaw = results[0];
    final listSosmedsRaw = results[1];

    final profile = profileRaw is ProfileModel ? profileRaw : null;
    final listSosmeds =
        listSosmedsRaw is List<SosmedModel> ? listSosmedsRaw : null;

    if (profile == null || listSosmeds == null) {
      return null;
    }
    
    return ProfileSosmedModel(
      profile: profile,
      listSosmeds: listSosmeds,
    );
  }
}
