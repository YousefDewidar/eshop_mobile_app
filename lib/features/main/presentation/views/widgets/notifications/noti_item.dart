import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool newNotification = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        onTap: () {
          setState(() {
            newNotification = false;
          });
        },
        contentPadding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 5,
          bottom: 12,
        ),
        tileColor:
            newNotification
                ? AppColors.lightPrimaryColor.withValues(alpha: 0.1)
                : Colors.transparent,
        titleAlignment: ListTileTitleAlignment.top,
        minTileHeight: 60,
        leading: SvgPicture.asset(
          Assets.imagesDone,
          width: 60,
          height: 60,
          fit: BoxFit.fill,
        ),
        title: const Text(
          'خصم 50% على كل الفواكه بمناسبة شهر رمضان والعيد',
          style: TextStyles.semiBold13,
        ),
        trailing: Text(
          '9 صباحا',
          style: TextStyles.regular13.copyWith(color: AppColors.greyColor),
        ),
      ),
    );
  }
}
