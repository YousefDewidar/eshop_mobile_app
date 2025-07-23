import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:rfaye3/features/auth/presentation/cubit/sign_up_cubit/sign_up_states.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/custom_text_field.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/login/password_field.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/signup/allready_have_acc.dart';
import 'package:rfaye3/features/auth/presentation/views/widgets/signup/terms_and_cond.dart';
import 'package:rfaye3/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final _emailCon = TextEditingController();
  final _passCon = TextEditingController();
  final _firstNameCon = TextEditingController();
  final _lastNameCon = TextEditingController();

  bool _isTermsAccepted = true;

  @override
  void dispose() {
    _emailCon.dispose();
    _passCon.dispose();
    _firstNameCon.dispose();
    _lastNameCon.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp(
        _firstNameCon.text.trim(),
        _lastNameCon.text.trim(),
        _emailCon.text.trim(),
        _passCon.text.trim(),
      );
    } else {
      setState(() => _autovalidateMode = AutovalidateMode.always);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SpaceV(10),
              CustomTextField(
                controller: _firstNameCon,
                hint: S.of(context).fullName,
              ),
              const SpaceV(16),
              CustomTextField(
                controller: _lastNameCon,
                hint: S.of(context).fullName,
              ),
              const SpaceV(16),
              CustomTextField(controller: _emailCon, hint: S.of(context).email),
              const SpaceV(16),
              PasswordField(controller: _passCon),
              const SpaceV(16),
              TermsAndCond(
                onChange: (value) {
                  setState(() => _isTermsAccepted = value);
                },
              ),
              const SpaceV(30),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return CustomButton(
                    isEnabled: _isTermsAccepted,
                    // isLoading: state is SignUpLoading,
                    title: S.of(context).createAcc,
                    onPressed: _isTermsAccepted ? _onSubmit : null,
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
