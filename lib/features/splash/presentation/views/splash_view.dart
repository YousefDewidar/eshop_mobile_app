import 'package:flutter/material.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_flutter/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    navigateMethod();
  }

  void navigateMethod() async {
    bool seenLanding =
        getIt.get<SharedPreferences>().getBool("viewLanding") ?? false;

    final data = await SecureStorage.getUserTokens();

    if (data.accessToken != null) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      });
    } else if (seenLanding && data.accessToken == null) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, Routes.login);
        }
      });
    } else if (!seenLanding) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, Routes.landing);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            Assets.imagesPlant,
            height: 180,
            alignment: Alignment.topLeft,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(Assets.imagesLand1, height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Accessory ',
                        style: TextStyles.bold28.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'HUB',
                        style: TextStyles.bold28.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(Assets.imagesSplashBottom, height: 180),
        ],
      ),
    );
  }
}
