import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';

class ShipTypeCard extends StatelessWidget {
  final String title, title2, price;
  final bool sel;
  const ShipTypeCard({
    super.key,
    required this.title,
    required this.title2,
    required this.price,
    required this.sel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          border: sel ? Border.all(color: AppColors.primaryColor) : null,
          borderRadius: BorderRadius.circular(4),
          color: AppColors.greyColor.withValues(alpha: 0.1)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: sel ? AppColors.primaryColor : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: sel ? 4 : 1,
                  color: sel ? Colors.white : const Color(0xff949D9E),
                ),
              ),
            ),
            const SpaceH(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.semiBold13),
                const SpaceV(8),
                Text(title2,
                    style: TextStyles.regular13
                        .copyWith(color: AppColors.greyColor)),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                price,
                style: TextStyles.bold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
