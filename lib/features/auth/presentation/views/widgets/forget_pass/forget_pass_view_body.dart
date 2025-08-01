import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/custom_text_field.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_state.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class ForgetPassViewBody extends StatefulWidget {
  const ForgetPassViewBody({super.key});

  @override
  State<ForgetPassViewBody> createState() => _ForgetPassViewBodyState();
}

class _ForgetPassViewBodyState extends State<ForgetPassViewBody> {
  final TextEditingController _emailCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailCon.dispose();
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
                S.of(context).forgetPass3,
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              const SpaceV(30),
              CustomTextField(controller: _emailCon, hint: S.of(context).email),
              const SpaceV(30),
              BlocConsumer<ForgetPassCubit, ForgetPassState>(
                listener: (context, state) {
                  if (state is ForgetPassSuccess) {
                    showNotification(
                      context,
                      "تم ارسال كود علي ايميلك",
                      NotiType.success,
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.validateOtp,
                      arguments: _emailCon.text,
                    );
                  } else if (state is ForgetPassFailure) {
                    showNotification(context, state.message, NotiType.error);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is ForgetPassLoading,
                    title: S.of(context).forgetPassButton,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ForgetPassCubit>().forgetPassword(
                          email: _emailCon.text,
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
