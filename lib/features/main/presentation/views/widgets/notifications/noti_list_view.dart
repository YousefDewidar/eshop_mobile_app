import 'package:flutter/material.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/noti_item.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 15,
      itemBuilder: (context, index) => const NotificationItem(),
    );
  }
}
