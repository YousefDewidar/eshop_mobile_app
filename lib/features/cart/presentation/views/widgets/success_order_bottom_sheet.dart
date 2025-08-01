import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class SuccessOrderBottomSheet extends StatelessWidget {
  const SuccessOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/animations/order_success.json', height: 250),
            Text(S.of(context).orderSuccess, style: TextStyles.bold19),
            const SpaceV(5),
            Text(S.of(context).orderSuccess2, style: TextStyles.medium15),
            const SpaceV(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    title: S.of(context).orderSuccess3,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Routes.orders);
                    },
                  ),
                ),
                const SpaceH(10),

                Expanded(
                  child: CustomButton(
                    title: S.of(context).cancle,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            const SpaceV(20),
          ],
        ),
      ),
    );
  }
}
