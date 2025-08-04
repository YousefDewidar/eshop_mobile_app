import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/features/main/data/models/notification_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/notifications_cubit/notification_cubit.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key, required this.notification});
  final NotificationModel notification;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool isRead = false;

  @override
  void initState() {
    super.initState();
    isRead = widget.notification.isRead;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 16),
      child: ListTile(
        onTap: () {
          if (widget.notification.isRead) return;
          isRead = true;
          setState(() {});
          context.read<NotificationCubit>().markAsRead(
            notiId: widget.notification.id,
          );
        },
        contentPadding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 5,
          bottom: 12,
        ),
        tileColor:
            isRead
                ? const Color.fromARGB(22, 148, 147, 147)
                : AppColors.lightPrimaryColor.withValues(alpha: 0.1),
        titleAlignment: ListTileTitleAlignment.top,
        minTileHeight: 60,

        shape: RoundedRectangleBorder(
          side:
              isRead
                  ? BorderSide.none
                  : BorderSide(
                    width: 2,
                    color: AppColors.lightPrimaryColor.withValues(alpha: 0.1),
                  ),
        ),

        title: Text(
          widget.notification.notificationText,
          style: TextStyles.semiBold13.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        trailing: Text(
          widget.notification.createdAt.toString().split(' ').first,
          style: TextStyles.regular13.copyWith(color: AppColors.greyColor),
        ),
      ),
    );
  }
}
