import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/splash/presentation/views/widgets/landing_page_view.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: LandingPageView(pageController: pageController)),
          const SpaceV(29),
          DotsIndicator(
            dotsCount: 2,
            reversed: true,
            decorator: DotsDecorator(
              color: AppColors.primaryColor,
              activeColor:
                  currentPage == 1
                      ? AppColors.primaryColor
                      : AppColors.lightPrimaryColor.withValues(alpha: .5),
              size: const Size.fromRadius(5),
            ),
          ),
          const SpaceV(29),
          Visibility(
            visible: currentPage == 1 ? true : false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
              child: CustomButton(
                onPressed: () {
                  getIt.get<SharedPreferences>().setBool("viewLanding", true);
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                title: S.of(context).startNow,
              ),
            ),
          ),
          const SpaceV(43),
        ],
      ),
    );
  }
}
