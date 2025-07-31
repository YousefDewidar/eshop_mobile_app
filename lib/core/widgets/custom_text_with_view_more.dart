import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';

class CustomTextWithViewMore extends StatelessWidget {
  const CustomTextWithViewMore({
    super.key,
    required this.onTap,
    required this.title,
  });
  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyles.bold16),
        InkWell(
          onTap: onTap,
          child: Text(
            S.of(context).more,
            style: TextStyles.regular13.copyWith(color: AppColors.greyColor),
          ),
        ),
      ],
    );
  }
}
