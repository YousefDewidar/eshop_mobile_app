class ReviewModel {
  final String comment;
  final int rating;
  final DateTime createdAt;
  final String userName;
  final String userPicture;

  const ReviewModel({
    required this.comment,
    required this.rating,
    required this.createdAt,
    required this.userName,
    required this.userPicture,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      comment: json['comment'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['createdAt']),
      userName: json['userName'],
      userPicture: json['userPicture'],
    );
  }
}
