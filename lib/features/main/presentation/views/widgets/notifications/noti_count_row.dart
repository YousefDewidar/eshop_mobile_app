import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class NotificationCountRow extends StatelessWidget {
  const NotificationCountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHoripadding,
          vertical: 16,
        ),
        child: Row(
          children: [
            Text(S.of(context).new_notification, style: TextStyles.bold16),
            const SpaceH(6),
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.lightPrimaryColor.withValues(
                alpha: 0.1,
              ),
              child: Text(
                '2',
                style: TextStyles.bold13.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Spacer(),
            Text(
              S.of(context).selectAllRead,
              style: TextStyles.regular13.copyWith(color: AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
