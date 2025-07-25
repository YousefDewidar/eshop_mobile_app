import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final bool isLoading;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isEnabled
              ? AppColors.primaryColor
              : const Color.fromARGB(143, 45, 159, 93),
        ),
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(59)),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      child:
          isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                title,
                textAlign: TextAlign.end,
                style: TextStyles.bold16.copyWith(color: Colors.white),
              ),
    );
  }
}
