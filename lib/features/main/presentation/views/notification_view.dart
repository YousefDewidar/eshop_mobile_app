import 'package:flutter/material.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: NotificationViewBody(),
      ),
    );
  }
}
