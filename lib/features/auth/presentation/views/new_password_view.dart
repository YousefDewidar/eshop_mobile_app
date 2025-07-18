import 'package:flutter/material.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/new_pass/new_password_view_body.dart';
import 'package:rfaye3/generated/l10n.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, S.of(context).newPassAppbar),
      body: const SafeArea(child: NewPasswordViewBody()),
    );
  }
}
