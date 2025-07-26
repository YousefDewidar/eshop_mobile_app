import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginCard extends StatelessWidget {
  final String title, icon;
  final void Function()? onTap;

  const SocialLoginCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: const Color(0xffDDDFDF))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpaceH(17.5),
            SvgPicture.asset(icon),
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xff0C0D0D)),
            ),
            const SpaceH(17.5),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
