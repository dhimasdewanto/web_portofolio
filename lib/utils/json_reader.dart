import 'dart:convert';

import 'package:flutter/widgets.dart';

abstract class JsonReader {
  JsonReader(this.context);

  final BuildContext context;

  @protected
  Future<Map> readJsonFile(String fileLocation) async {
    final jsonFromFile = await DefaultAssetBundle.of(context).loadString(
      fileLocation,
    );

    return json.decode(jsonFromFile) as Map;
  }
}
