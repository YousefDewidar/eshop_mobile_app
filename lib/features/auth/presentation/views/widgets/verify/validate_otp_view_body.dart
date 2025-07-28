import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_state.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/verify/otp_widget.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class ValidateOtpViewBody extends StatefulWidget {
  final String email;

  const ValidateOtpViewBody({super.key, required this.email});

  @override
  State<ValidateOtpViewBody> createState() => _ValidateOtpViewBodyState();
}

class _ValidateOtpViewBodyState extends State<ValidateOtpViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

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
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              const SpaceV(30),
              OtpWidget(otpControllers: _otpControllers),
              const SpaceV(30),
              BlocConsumer<ForgetPassCubit, ForgetPassState>(
                listener: (context, state) {
                  if (state is ForgetPassSuccess) {
                    final otp = _otpControllers.map((code) => code.text).join();
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.newPassword,
                      arguments: {"email": widget.email, "otp": otp},
                    );
                  } else if (state is ForgetPassFailure) {
                    showNotification(context, state.message, NotiType.error);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is ForgetPassLoading,
                    title: S.of(context).verifyButton,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final otp =
                            _otpControllers.map((code) => code.text).join();
                        context.read<ForgetPassCubit>().validateOtp(
                          code: otp,
                          email: widget.email,
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
}
