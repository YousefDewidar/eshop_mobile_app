import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/verify/validate_otp_view_body.dart';

class ValidateOtpView extends StatelessWidget {
  final String email;

  const ValidateOtpView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, "تحقق من الرمز"),
        body: SafeArea(child: ValidateOtpViewBody(email: email)),
      ),
    );
  }
}
