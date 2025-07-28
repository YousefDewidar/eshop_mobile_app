import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/profile/presentation/views/widgets/setting_item.dart';
import 'package:rfaye3/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(S.of(context).profile, style: TextStyles.bold19),
          const SpaceV(10),

          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: kHoripadding,
            ),
            title: Text(
              SecureStorage.getUserData().name ?? "",
              style: TextStyles.bold16.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            subtitle: Text(
              SecureStorage.getUserData().email ?? "",
              style: TextStyles.regular16.copyWith(
                color: const Color(0xff949D9E),
              ),
            ),

            leading:
                SecureStorage.getUserData().image == null
                    ? Image.asset(Assets.imagesProfileImage, width: 44)
                    : Container(
                      width: 60,
                      height: 100,
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
          ),
          const SpaceV(10),

          SettingItem(
            title: S.of(context).set1,
            icon: Assets.imagesSet1,
            secPageName: Routes.personal,
          ),
          SettingItem(
            title: S.of(context).set2,
            icon: Assets.imagesSet2,
            secPageName: Routes.orders,
          ),

          SettingItem(
            title: S.of(context).set6,
            icon: Assets.imagesSet6,
            langSwitch: true,
          ),
          SettingItem(
            title: S.of(context).set7,
            icon: Assets.imagesSet7,
            hasSwitch: true,
          ),
          SpaceV(MediaQuery.of(context).size.height * 0.2),

          InkWell(
            onTap: () async {
              await SecureStorage.deleteUserData();
              if (context.mounted) {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(Routes.login, (route) => false);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              color: AppColors.lightPrimaryColor.withValues(alpha: 0.15),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).signOut, style: TextStyles.regular16),
                  const SpaceH(20),
                  Transform.rotate(
                    angle: 180 * 3.14 / 180,
                    child: const Icon(
                      Icons.logout_rounded,
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpaceV(60),
        ],
      ),
    );
  }
}
