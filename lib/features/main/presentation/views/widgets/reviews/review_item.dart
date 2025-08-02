import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/review_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(
                review.userPicture,
                errorListener: (p0) {
                  return;
                },
              ),
            ),
            const SpaceH(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(review.userName, style: TextStyles.semiBold16),
                Text(
                  review.createdAt.toString().split(' ').first,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SpaceV(10),
        Text(
          review.comment,
          style: TextStyles.regular13.copyWith(color: AppColors.greyColor),
        ),
      ],
    );
  }
}
