import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/icon_back.dart';
import 'package:rfaye3/core/widgets/notification_icon.dart';

class AppBarWithNotification extends StatelessWidget {
  final String title;
  final bool hasBack;
  final bool hasNoti;
  const AppBarWithNotification({
    super.key,
    required this.title,
    this.hasBack = true,
    this.hasNoti = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      scrolledUnderElevation: 0,
      shadowColor: const Color.fromARGB(255, 26, 23, 23),
      elevation: 60,
      pinned: true,
      actions: [
        Visibility(
          visible: hasNoti,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: NotificationIcon(),
          ),
        ),
      ],
      leading: Visibility(
        visible: hasBack,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: IconsBack(),
        ),
      ),
      leadingWidth: 70,
      title: Text(
        title,
        style: TextStyles.bold19.copyWith(
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
      centerTitle: true,
    );
  }
}
