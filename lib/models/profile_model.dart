class ProfileModel {
  ProfileModel({
    required this.name,
    required this.description,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
      : name = (json['name'] ?? "") as String,
        description = (json['description'] as List)
            .map<String>((desc) => desc as String)
            .toList();

  final String name;
  final List<String> description;
}
