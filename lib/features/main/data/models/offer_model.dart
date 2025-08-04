class OfferModel {
  final String id;
  final String name;
  final String description;
  final String coverUrl;
  final DateTime createdAt;

  OfferModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverUrl,
    required this.createdAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      coverUrl: json['coverUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
