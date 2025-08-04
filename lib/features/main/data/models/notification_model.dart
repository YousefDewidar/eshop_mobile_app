class NotificationModel {
  final String id;
  final String notificationText;
  final DateTime createdAt;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.notificationText,
    required this.createdAt,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      notificationText: json['notificationText'],
      createdAt: DateTime.parse(json['createdAt']),
      isRead: json['isRead'],
    );
  }
}
