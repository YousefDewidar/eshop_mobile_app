import 'package:flutter/material.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/features/authentication/presentation/views/widgets/forget_pass/forget_pass_view_body.dart';
import 'package:rfaye3/generated/l10n.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, S.of(context).forgetPassAppbar),
      body: const SafeArea(
        child: ForgetPassViewBody(),
      ),
    );
  }
}
