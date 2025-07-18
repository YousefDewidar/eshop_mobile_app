
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:svg_flutter/svg.dart';

class AddressReview extends StatelessWidget {
  const AddressReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("عنوان التوصيل", style: TextStyles.bold13),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SvgPicture.asset(Assets.imagesLocation),
            const SpaceH(8),
            Text(
              "شارع النيل، مبنى رقم ١٢٣",
              style: TextStyles.regular16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
