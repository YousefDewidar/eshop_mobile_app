class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      coverPictureUrl: map['coverPictureUrl'] as String,
    );
  }
}
