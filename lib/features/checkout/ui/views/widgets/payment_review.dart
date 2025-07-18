
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/ui/views/widgets/payment_section.dart';

class PaymentReview extends StatelessWidget {
  const PaymentReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("وسيلة الدفع", style: TextStyles.bold13),
            Row(
              children: [
                const Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.greyColor,
                ),
                const SpaceH(3),
                Text(
                  "تعديل",
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SpaceV(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "**** **** **** 6522",
              style: TextStyles.regular16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            const SpaceH(15),
            Transform.scale(
              scale: .9,
              child: const PaymentTypeCard(img: Assets.imagesPaypal),
            ),
          ],
        ),
      ],
    );
  }
}
