// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_state.dart';
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
  final String email;
  final String otp;
  const NewPasswordViewBody({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
        child: Form(
          key: _formKey,
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

              BlocConsumer<ForgetPassCubit, ForgetPassState>(
                listener: (context, state) {
                  if (state is ForgetPassSuccess) {
                    showNotification(
                      context,
                      "تم تغيير كلمة المرور بنجاح",
                      NotiType.success,
                    );
                    Navigator.pushReplacementNamed(context, Routes.login);
                  } else if (state is ForgetPassFailure) {
                    showNotification(context, state.message, NotiType.error);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is ForgetPassLoading,
                    title: S.of(context).verifyButton,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          showNotification(
                            context,
                            "كلمة المرور غير متطابقة",
                            NotiType.warning,
                          );
                          return;
                        }

                        context.read<ForgetPassCubit>().resetPassword(
                          newPassword: _passwordController.text,
                          email: widget.email,
                          otp: widget.otp,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
            ],
          ),
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
                Text(S.of(context).newPassDone, style: TextStyles.bold16),
              ],
            ),
          ),
        );
      },
    );
  }
}
