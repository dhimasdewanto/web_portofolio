class SosmedModel {
  SosmedModel({
    required this.iconName,
    required this.name,
    required this.link,
  });

  SosmedModel.fromJson(Map<String, dynamic> json)
      : iconName = (json['iconName'] ?? "") as String,
        name = (json['name'] ?? "") as String,
        link = (json['link'] ?? "") as String;

  final String iconName;
  final String name;
  final String link;
}
