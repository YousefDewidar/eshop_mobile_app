import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/profile/presentation/view_model/settings_cubit/settings_cubit.dart';
import 'package:svg_flutter/svg.dart';

class SettingItem extends StatefulWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.icon,
    this.hasSwitch = false,
    this.langSwitch = false,
    this.secPageName,
  });

  final String title;
  final String? secPageName;
  final String icon;
  final bool hasSwitch;
  final bool langSwitch;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool switchValue = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    final settingsCubit = context.read<SettingsCubit>();
    if (widget.langSwitch) {
      switchValue = settingsCubit.langCode == 'ar';
    } else {
      switchValue = settingsCubit.isDark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.watch<SettingsCubit>();
    final currentLang = settingsCubit.langCode;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        ListTile(
          onTap: () {
            if (widget.langSwitch) {
              isExpanded = !isExpanded;
              setState(() {});
            } else if (widget.secPageName != null && !widget.hasSwitch) {
              Navigator.pushNamed(context, widget.secPageName!);
            } else if (widget.secPageName == null && widget.hasSwitch) {
              switchValue = !switchValue;
              setState(() {});
              if (widget.langSwitch) {
                settingsCubit.changeLanguage(
                  langCode: settingsCubit.langCode == 'ar' ? 'en' : 'ar',
                );
              } else {
                settingsCubit.changeTheme(isDark: !settingsCubit.isDark);
              }
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
                      switchValue = value;
                      setState(() {});
                      if (widget.langSwitch) {
                        settingsCubit.changeLanguage(
                          langCode:
                              settingsCubit.langCode == 'ar' ? 'en' : 'ar',
                        );
                      } else {
                        settingsCubit.changeTheme(
                          isDark: !settingsCubit.isDark,
                        );
                      }
                    },
                    activeColor: AppColors.lightPrimaryColor,
                  )
                  : const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff949D9E),
                  ),
          leading: SvgPicture.asset(widget.icon),
        ),
        if (widget.langSwitch && isExpanded) ...[
          const SpaceV(6),
          _buildLangCard(
            context,
            title: "العربية",
            code: "ar",
            isCurrent: currentLang == 'ar',
            isDark: isDark,
          ),
          const SpaceV(10),
          _buildLangCard(
            context,
            title: "English",
            code: "en",
            isCurrent: currentLang == 'en',
            isDark: isDark,
          ),
        ],
      ],
    );
  }

  Widget _buildLangCard(
    BuildContext context, {
    required String title,
    required String code,
    required bool isCurrent,
    required bool isDark,
  }) {
    return InkWell(
      onTap: () {
        context.read<SettingsCubit>().changeLanguage(langCode: code);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: kHoripadding),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:
              isCurrent
                  ? (isDark
                      ? AppColors.primaryColor.withValues(alpha: .2)
                      : AppColors.lightPrimaryColor.withValues(alpha: 0.3))
                  : Theme.of(context).colorScheme.surface,
          border: Border.all(
            color:
                isCurrent
                    ? AppColors.primaryColor
                    : Colors.grey.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.regular16.copyWith(
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}
