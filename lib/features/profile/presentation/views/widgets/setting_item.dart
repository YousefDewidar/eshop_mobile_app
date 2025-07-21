import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:svg_flutter/svg.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.icon,
    this.hasSwitch = false,
  });
  final String title;
  final String icon;
  final bool hasSwitch;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: kHoripadding),
      title: Text(
        title,
        style: TextStyles.regular16.copyWith(
          color: const Color.fromARGB(255, 97, 102, 103),
        ),
      ),
      trailing:
          hasSwitch
              ? Switch(value: false, onChanged: (bool value) {})
              : const Icon(Icons.arrow_forward_ios, color: Color(0xff949D9E)),
      leading: SvgPicture.asset(icon),
    );
  }
}
