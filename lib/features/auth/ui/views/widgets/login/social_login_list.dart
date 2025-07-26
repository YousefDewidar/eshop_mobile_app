import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/auth/ui/managers/login/login_cubit.dart';
import 'package:rfaye3/features/auth/ui/views/widgets/login/social_login_card.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class SocialLoginList extends StatelessWidget {
  const SocialLoginList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginCard(
          icon: Assets.imagesGoogleIcon,
          title: S.of(context).google,
          onTap: () {
            context.read<LoginCubit>().loginWithGoogle();
          },
        ),
        const SpaceV(16),
        SocialLoginCard(
          icon: Assets.imagesAppleIcon,
          title: S.of(context).apple,
          onTap: () {},
        ),
        const SpaceV(16),
        SocialLoginCard(
          icon: Assets.imagesFacebookIcon,
          title: S.of(context).face,
          onTap: () {
            // context.read<LoginCubit>().loginWithFacebook();
          },
        ),
      ],
    );
  }
}
