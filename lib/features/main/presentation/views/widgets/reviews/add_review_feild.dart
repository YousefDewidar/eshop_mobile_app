import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class AddReviewFeild extends StatelessWidget {
  const AddReviewFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.black26),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SecureStorage.getUserData().image == null
              ? Image.asset(Assets.imagesProfileImage, width: 15)
              : Container(
                width: 35,
                height: 35,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      SecureStorage.getUserData().image!,
                    ),
                  ),
                ),
              ),
          const SpaceH(10),
          Text(
            S.of(context).addReview,
            style: TextStyles.semiBold16.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          const Spacer(),
          const Icon(Icons.add_rounded, color: AppColors.primaryColor),
          const SpaceH(16),
        ],
      ),
    );
  }
}
