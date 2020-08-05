import 'dart:convert';

import 'package:flutter/widgets.dart';

abstract class JsonReader<T> {
  JsonReader(this.context);

  final BuildContext context;

  Future<T> getJsonFile();

  @protected
  Future<ListOrMap> readJsonFile<ListOrMap>(String fileLocation) async {
    final jsonFromFile = await DefaultAssetBundle.of(context).loadString(
      fileLocation,
    );

    return json.decode(jsonFromFile) as ListOrMap;
  }
}
