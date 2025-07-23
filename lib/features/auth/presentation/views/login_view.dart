import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/login_view_body.dart';

import 'package:rfaye3/generated/l10n.dart';
import 'package:rfaye3/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:rfaye3/features/auth/presentation/cubit/login_cubit/login_states.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, Routes.home);
          } else if (state is LoginFailure) {
            showNotification(context, state.message, NotiType.error);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoginLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(S.of(context).login, style: TextStyles.bold19),
                centerTitle: true,
              ),
              body: const SafeArea(child: LoginViewBody()),
            ),
          );
        },
      ),
    );
  }
}
