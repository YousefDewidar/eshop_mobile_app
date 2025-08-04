import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/view_model/notifications_cubit/notification_cubit.dart';
import 'package:rfaye3/generated/l10n.dart';

class NotificationCountRow extends StatelessWidget {
  const NotificationCountRow({super.key, this.count = 0});
  final int count;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: Row(
          children: [
            const Text("عدد الاشعارات", style: TextStyles.semiBold16),
            const SpaceH(8),
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.lightPrimaryColor.withValues(
                alpha: 0.1,
              ),
              child: Text(
                count.toString(),
                style: TextStyles.bold13.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            const Spacer(),
            TextButton(
              onPressed: () {
                context.read<NotificationCubit>().markAsRead(markAll: true);
              },
              child: Text(
                S.of(context).selectAllRead,
                style: TextStyles.regular13.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
