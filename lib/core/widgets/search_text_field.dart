import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.enabled = true,
    this.onSubmitted,
    this.onChanged,
  });
  final bool enabled;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;

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
      child: TextField(
          enabled: enabled,
          cursorColor: AppColors.primaryColor,
          decoration: customDecoration(context),
          textInputAction: TextInputAction.search,
          onSubmitted: onSubmitted,
          onChanged: onChanged),
    );
  }

  InputDecoration customDecoration(BuildContext context) {
    return InputDecoration(
      hintText: S.of(context).searchHint,
      hintStyle: TextStyles.regular13.copyWith(color: AppColors.greyColor),
      filled: true,
      fillColor: Colors.white,
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
      suffixIcon: SvgPicture.asset(
        Assets.imagesFilter,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
