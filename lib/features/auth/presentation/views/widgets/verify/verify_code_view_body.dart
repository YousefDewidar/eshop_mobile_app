import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/auth/presentation/managers/verify/verify_cubit.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/verify/otp_widget.dart';
import 'package:rfaye3/generated/l10n.dart';

class VerifyCodeViewBody extends StatefulWidget {
  const VerifyCodeViewBody({super.key, required this.email});
  final String email;

  @override
  State<VerifyCodeViewBody> createState() => _VerifyCodeViewBodyState();
}

class _VerifyCodeViewBodyState extends State<VerifyCodeViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SpaceV(10),
              Text(
                '${S.of(context).verifyBody} ${widget.email}',
                style:
                    TextStyles.semiBold16.copyWith(color: AppColors.greyColor),
              ),
              const SpaceV(30),
              OtpWidget(otpControllers: _otpControllers),
              const SpaceV(30),
              CustomButton(
                  title: S.of(context).verifyButton,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final code =
                          _otpControllers.map((code) => code.text).join();
                      context.read<VerifyCubit>().verifyEmail(
                            code: code,
                            email: widget.email,
                          );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }),
              const SpaceV(25),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    context.read<VerifyCubit>().resendOtp(
                          email: widget.email,
                        );
                  },
                  child: Text(
                    S.of(context).verifyAgain,
                    textAlign: TextAlign.end,
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
