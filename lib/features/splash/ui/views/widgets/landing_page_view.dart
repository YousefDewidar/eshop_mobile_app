import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/features/splash/ui/views/widgets/page_view_item.dart';
import 'package:rfaye3/generated/l10n.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesLand1,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          subtitle: S.of(context).land1SubTitle,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).land1Title, style: TextStyles.bold23),
              Text(
                '  HUB ',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Accessory',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),

        PageViewItem(
          isVisible: false,
          image: Assets.imagesLand1,
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
          subtitle: S.of(context).land2SubTitle,
          title: Text(
            S.of(context).land2Title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0C0D0D),
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
