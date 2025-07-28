import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/new_pass/new_password_view_body.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/generated/l10n.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key, required this.email, required this.otp});
  final String email;
  final String otp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, S.of(context).newPassAppbar),
        body: SafeArea(child: NewPasswordViewBody(email: email, otp: otp)),
      ),
    );
  }
}
