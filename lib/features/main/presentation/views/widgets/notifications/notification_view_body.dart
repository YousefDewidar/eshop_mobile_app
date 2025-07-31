import 'package:flutter/material.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/app_bar_with_notification.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/noti_count_row.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/noti_list_view.dart';
import 'package:rfaye3/generated/l10n.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        AppBarWithNotification(title: S.of(context).notification),
        const SliverToBoxAdapter(child: SpaceV(16)),
        const NotificationCountRow(),
        const NotificationListView(),
      ],
    );
  }
}
