import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String title;
  const PasswordField({
    super.key,
    required this.controller,
    this.onSaved,
    this.title = '',
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required;
        }
        return null;
      },
      onSaved: widget.onSaved,
      style: TextStyles.semiBold16,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: "${widget.title}${S.of(context).password}",
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.greyColor),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: IconButton(
            onPressed: () {
              _obscureText = !_obscureText;
              setState(() {});
            },
            icon: Icon(
              _obscureText ? Icons.remove_red_eye : Icons.visibility_off,
            ),
            color: AppColors.greyColor,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: customBorder(context),
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
