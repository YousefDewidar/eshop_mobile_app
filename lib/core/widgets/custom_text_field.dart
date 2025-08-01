import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Widget? suffIcon;
  final bool required;
  final bool enabled;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    required this.hint,
    this.suffIcon,
    this.controller,
    this.onSaved,
    this.required = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      cursorColor: AppColors.primaryColor,
      controller: controller,
      validator: (value) {
        if ((value == null || value.isEmpty) && required) {
          return S.of(context).required;
        }
        return null;
      },
      onSaved: onSaved,
      style: TextStyles.semiBold16,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.greyColor),
        suffixIcon: suffIcon,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: customBorder(context),
        disabledBorder: customBorder(context),
        enabledBorder: customBorder(context),
        focusedBorder: customBorder(context),
      ),
    );
  }

  OutlineInputBorder customBorder(context) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        width: 1.3,
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.surface
                : Colors.grey.shade300,
      ),
    );
  }
}
