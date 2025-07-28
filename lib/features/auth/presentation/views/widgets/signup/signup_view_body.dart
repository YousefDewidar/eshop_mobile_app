import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/widgets/custom_text_field.dart';
import 'package:rfaye3/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:rfaye3/features/auth/presentation/managers/signup_cubit/signup_state.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/password_field.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/signup/allready_have_acc.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/signup/terms_and_cond.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final TextEditingController _confPassCon = TextEditingController();
  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isTermsEnabeld = false;

  @override
  void dispose() {
    _emailCon.dispose();
    _passCon.dispose();
    _confPassCon.dispose();
    _fNameCon.dispose();
    _lNameCon.dispose();
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
              CustomTextField(
                controller: _fNameCon,
                hint: S.of(context).firstName,
              ),
              const SpaceV(16),
              CustomTextField(
                controller: _lNameCon,
                hint: S.of(context).lastName,
              ),
              const SpaceV(16),
              CustomTextField(controller: _emailCon, hint: S.of(context).email),
              const SpaceV(16),
              PasswordField(controller: _passCon),
              const SpaceV(16),
              PasswordField(controller: _confPassCon, title: "تأكيد "),
              const SpaceV(16),
              TermsAndCond(
                onChange: (value) {
                  isTermsEnabeld = value;
                },
              ),
              const SpaceV(30),
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state is SignupSuccess) {
                    showNotification(
                      context,
                      S.of(context).signupSuccess,
                      NotiType.success,
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.verify,
                      arguments: _emailCon.text,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isEnabled: isTermsEnabeld,
                    title: S.of(context).createAcc,
                    onPressed:
                        !isTermsEnabeld
                            ? null
                            : () {
                              if (formKey.currentState!.validate()) {
                                if (_passCon.text == _confPassCon.text) {
                                  context
                                      .read<SignupCubit>()
                                      .signupWithEmailAndPassword(
                                        email: _emailCon.text,
                                        password: _passCon.text,
                                        fName: _fNameCon.text,
                                        lName: _lNameCon.text,
                                      );
                                } else {
                                  showNotification(
                                    context,
                                    "كلمة المرور غير متطابقة",
                                    NotiType.warning,
                                  );
                                }
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                  );
                },
              ),
              const SpaceV(30),
              const AllreadyHaveAcc(),
            ],
          ),
        ),
      ),
    );
  }
}
