import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:svg_flutter/svg.dart';

class SettingItem extends StatefulWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.icon,
    this.hasSwitch = false,
    this.secPageName,
  });
  final String title;
  final String? secPageName;
  final String icon;
  final bool hasSwitch;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (widget.secPageName != null && !widget.hasSwitch) {
          Navigator.pushNamed(context, widget.secPageName!);
        } else if (widget.secPageName == null && widget.hasSwitch) {
          switchValue = !switchValue;
          setState(() {});
        }
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: kHoripadding),
      title: Text(
        widget.title,
        style: TextStyles.regular16.copyWith(
          color: const Color.fromARGB(255, 97, 102, 103),
        ),
      ),
      trailing:
          widget.hasSwitch
              ? Switch(
                value: switchValue,
                onChanged: (bool value) {
                  switchValue = !switchValue;
                  setState(() {});
                },
                activeColor: AppColors.lightPrimaryColor,
              )
              : const Icon(Icons.arrow_forward_ios, color: Color(0xff949D9E)),
      leading: SvgPicture.asset(widget.icon),
    );
  }
}
