import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum NotiType {
  error,
  success,
  warning,
}

void showNotification(
  BuildContext context,
  String message,
  NotiType notiType,
) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      backgroundColor: notiType == NotiType.error
          ? Colors.red
          : notiType == NotiType.warning
              ? AppColors.lightSecondaryColor
              : AppColors.lightPrimaryColor,
      message: message,
      textStyle: TextStyles.bold16.copyWith(color: Colors.white),
    ),
  );
}
