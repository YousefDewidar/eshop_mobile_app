import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:rfaye3/features/auth/presentation/cubit/sign_up_cubit/sign_up_states.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/signup/signup_view_body.dart';
import 'package:rfaye3/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt()),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            showNotification(
              context,
              S.of(context).signupSuccess,
              NotiType.success,
            );
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => VerifyCodeView(email: state.user.email),
            //   ),
            // );
          } else if (state is SignUpFailure) {
            showNotification(context, state.message, NotiType.error);
          }
        },
        child: Scaffold(
          appBar: customAppBar(context, S.of(context).signUp),
          body: const SafeArea(child: SignupViewBody()),
        ),
      ),
    );
  }
}
