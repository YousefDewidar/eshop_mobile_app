import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/ui/managers/verify/verify_cubit.dart';
import 'package:rfaye3/features/auth/ui/managers/verify/verify_state.dart';
import 'package:rfaye3/features/auth/ui/views/widgets/verify/verify_code_view_body.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(getIt.get<AuthRepo>()),
      child: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            Navigator.pushReplacementNamed(context, Routes.home);
          } else if (state is VerifyEmailFailure) {
            showNotification(context, state.message, NotiType.error);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is VerifyEmailLoading,
            child: Scaffold(
              appBar: customAppBar(context, S.of(context).verifyAppbar),
              body: SafeArea(child: VerifyCodeViewBody(email: email)),
            ),
          );
        },
      ),
    );
  }
}
