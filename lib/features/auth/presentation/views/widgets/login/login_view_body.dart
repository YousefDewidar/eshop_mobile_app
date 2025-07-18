import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/auth/domain/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/presentation/managers/login/login_cubit.dart';
import 'package:rfaye3/features/auth/presentation/managers/login/login_state.dart';
import 'package:rfaye3/features/auth/presentation/views/verify_code_view.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/custom_text_field.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/dont_have_acc.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/forget_pass_text_button.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/or_divider.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/password_field.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/social_login_card.dart';
import 'package:rfaye3/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailCon.dispose();
    _passCon.dispose();
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
              CustomTextField(controller: _emailCon, hint: S.of(context).email),
              const SpaceV(16),
              PasswordField(controller: _passCon),
              const SpaceV(8),
              const ForgetPasswordTextButton(),
              const SpaceV(25),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  handleEmailNotConfirmed(state, context);
                },
                child: CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().loginWithEmailAndPassword(
                        email: _emailCon.text,
                        password: _passCon.text,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  title: S.of(context).login,
                ),
              ),
              const SpaceV(26),
              const DontHaveAcc(),
              const SpaceV(50),
              const OrDivider(),
              const SpaceV(26),
              SocialLoginCard(
                icon: Assets.imagesGoogleIcon,
                title: S.of(context).google,
                onTap: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleEmailNotConfirmed(LoginState state, BuildContext context) {
    if (state is LoginFailure) {
      if (state.message == "Email not confirmed") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              AuthRepo authRepo = getIt.get<AuthRepo>();
              authRepo.resendOtp(email: _emailCon.text);
              return VerifyCodeView(email: _emailCon.text);
            },
          ),
        );
      }
    }
  }
}
