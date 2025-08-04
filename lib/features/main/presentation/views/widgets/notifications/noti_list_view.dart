import 'package:flutter/material.dart';
import 'package:rfaye3/features/main/data/models/notification_model.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/noti_item.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key, required this.notifications});
  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: notifications.length,
      itemBuilder:
          (context, index) =>
              NotificationItem(notification: notifications[index]),
    );
  }
}
