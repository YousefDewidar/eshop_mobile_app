// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/password_field.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({super.key});

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SpaceV(10),
            Text(
              S.of(context).newPassBody,
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xff0C0D0D),
              ),
            ),
            const SpaceV(30),
            PasswordField(controller: _passwordController),
            const SpaceV(16),
            PasswordField(
              controller: _confirmPasswordController,
              title: S.of(context).confirmPass,
            ),
            const SpaceV(30),
            CustomButton(
              title: S.of(context).newPassButton,
              onPressed: () {
                successDialog(context);
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, Routes.login);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> successDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.imagesDone),
                const SizedBox(height: 30),
                Text(
                  S.of(context).newPassDone,
                  style: TextStyles.bold16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
