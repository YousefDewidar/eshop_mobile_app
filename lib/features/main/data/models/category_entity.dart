
class CategoryEntity {
  final String id;
  final String name;

  CategoryEntity({required this.id, required this.name});

  factory CategoryEntity.fromJson(Map<String, dynamic> map) {
    return CategoryEntity(id: map['id'] as String, name: map['name'] as String);
  }

}
