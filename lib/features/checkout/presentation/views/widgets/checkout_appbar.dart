import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/icon_back.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        const IconsBack(),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.bold19,
          ),
        ),
        // const Spacer(),
      ],
    );
  }
}
