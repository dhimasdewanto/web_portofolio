class ProjectModel {
  ProjectModel({
    required this.name,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.tags,
  });

  ProjectModel.fromJson(Map<String, dynamic> json)
      : name = (json['name'] ?? "") as String,
        description = (json['description'] ?? "") as String,
        url = (json['url'] ?? "") as String,
        imageUrl = (json['image_url'] ?? "") as String,
        tags = ((json['tags'] as List).map((tag) => tag as String).toList());

  final String name;
  final String description;
  final String url;
  final String imageUrl;
  final List<String> tags;
}
