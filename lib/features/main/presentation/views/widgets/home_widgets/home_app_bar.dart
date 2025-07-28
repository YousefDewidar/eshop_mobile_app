import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/notification_icon.dart';
import 'package:rfaye3/generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        S.of(context).homeHello,
        style: TextStyles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: Text(
        SecureStorage.getUserData().name ?? "",
        style: TextStyles.bold16.copyWith(
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
      trailing: const NotificationIcon(),
      leading:
          SecureStorage.getUserData().image == null
              ? Image.asset(Assets.imagesProfileImage, width: 44)
              : Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      SecureStorage.getUserData().image!,
                    ),
                  ),
                ),
              ),
    );
  }
}
