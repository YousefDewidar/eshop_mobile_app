import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:svg_flutter/svg.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpaceV(10),
        const Text("أختار طريقه الدفع المناسبه :", style: TextStyles.bold13),
        const SpaceV(13),
        Text(
          "من فضلك اختر طريقه الدفع المناسبه لك.",
          style: TextStyles.regular13.copyWith(color: AppColors.greyColor),
        ),
        const SpaceV(13),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaymentTypeCard(img: Assets.imagesPaypal),
            SpaceH(10),
            PaymentTypeCard(img: Assets.imagesPaypal),
            SpaceH(10),
            PaymentTypeCard(img: Assets.imagesPaypal),
          ],
        ),
      ],
    );
  }
}

class PaymentTypeCard extends StatelessWidget {
  final String img;
  const PaymentTypeCard({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD6DCE5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SvgPicture.asset(img),
    );
  }
}
