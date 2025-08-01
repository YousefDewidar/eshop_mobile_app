import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';

class ForgetPasswordTextButton extends StatelessWidget {
  const ForgetPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          Directionality.of(context) == TextDirection.rtl
              ? Alignment.centerLeft
              : Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.forgetPass);
        },
        child: Text(
          S.of(context).forgotPassword,
          textAlign: TextAlign.end,
          style: TextStyles.semiBold13.copyWith(
            color: AppColors.lightPrimaryColor,
          ),
        ),
      ),
    );
  }
}
