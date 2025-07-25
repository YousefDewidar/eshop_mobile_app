import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  Future<void> _checkConnection(BuildContext context) async {
    final results = await Connectivity().checkConnectivity();
    final hasConnection = results.any((e) => e != ConnectivityResult.none);
    if (!context.mounted) return;
    if (hasConnection) {
      Navigator.of(context).pop(); 
    } else {
      showNotification(context, S.of(context).noInternet, NotiType.warning);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/No_Connection.json'),

            Text(
              S.of(context).noInternet,
              textAlign: TextAlign.center,
              style: TextStyles.bold19,
            ),
            const SpaceV(15),

            Text(
              S.of(context).noInternet2,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16,
            ),
            const SpaceV(30),

            CustomButton(
              title: S.of(context).tryAgain,
              onPressed: () => _checkConnection(context),
            ),
          ],
        ),
      ),
    );
  }
}
