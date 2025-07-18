import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/icon_back.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    leadingWidth: 80,
    leading: const IconsBack(),
  );
}
