import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/notification_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/notifications_cubit/notification_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/app_bar_with_notification.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/noti_count_row.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/noti_list_view.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            AppBarWithNotification(
              title: S.of(context).notification,
              hasNoti: false,
            ),
            if (state is NotificationSuccess &&
                state.notifications.isNotEmpty) ...[
              NotificationCountRow(notifications: state.notifications),
              const SliverToBoxAdapter(child: SpaceV(8)),

              NotificationListView(notifications: state.notifications),
            ] else if (state is NotificationLoading) ...[
              const Skeletonizer.sliver(
                enabled: true,
                child: NotificationCountRow(notifications: [],),
              ),
              const SliverToBoxAdapter(child: SpaceV(8)),

              Skeletonizer.sliver(
                enabled: true,
                child: NotificationListView(
                  notifications: List.generate(
                    6,
                    (index) => NotificationModel(
                      id: "id",
                      notificationText: "notificationText",
                      createdAt: DateTime(200),
                      isRead: false,
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
