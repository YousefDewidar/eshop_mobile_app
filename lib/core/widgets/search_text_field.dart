import 'package:flutter/material.dart';
import 'package:languagetool_textfield/languagetool_textfield.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.enabled = true,
    this.onSubmitted,
    this.onChanged,
    this.hint,
  });
  final bool enabled;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final String? hint;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final controller = LanguageToolController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(11, 0, 0, 0),
            blurRadius: 9,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: LanguageToolTextField(
        controller: controller,
        onTextSubmitted: widget.onSubmitted,
        onTap: () {
          if (!widget.enabled) {
            Navigator.pushNamed(context, Routes.search);
          }
        },
        readOnly: !widget.enabled,
        decoration: customDecoration(context),
        cursorColor: AppColors.primaryColor,
        textInputAction: TextInputAction.search,
        language: 'en-US',
      ),
    );
  }

  InputDecoration customDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.hint ?? S.of(context).searchHint,
      hintStyle: TextStyles.regular13.copyWith(color: AppColors.greyColor),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.all(0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide.none,
      ),
      prefixIcon: SvgPicture.asset(
        Assets.imagesSearchIcon,
        // ignore: deprecated_member_use
        color: AppColors.primaryColor,
        fit: BoxFit.scaleDown,
      ),
      suffixIcon: SvgPicture.asset(Assets.imagesFilter, fit: BoxFit.scaleDown),
    );
  }
}
