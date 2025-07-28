import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';

class AllreadyHaveAcc extends StatelessWidget {
  const AllreadyHaveAcc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).allreadyhaveAccount,
          style: TextStyles.semiBold16.copyWith(color: AppColors.greyColor),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: const ButtonStyle(
              padding:
                  WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 5))),
          child: Text(
            S.of(context).login,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
