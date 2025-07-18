import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/auth/domain/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/ui/managers/signup/signup_cubit.dart';
import 'package:rfaye3/features/auth/ui/managers/signup/signup_state.dart';
import 'package:rfaye3/features/auth/ui/views/widgets/signup/signup_view_body.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepo>()),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupFailure) {
            showNotification(context, state.message, NotiType.error);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
                color: AppColors.secondaryColor),
            inAsyncCall: state is SignupLoading,
            child: Scaffold(
              appBar: customAppBar(context, S.of(context).signUp),
              body: const SafeArea(
                child: SignupViewBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
