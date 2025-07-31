import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/add_reviews_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/add_reviews_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/after_review_dialog.dart';
import 'package:rfaye3/generated/l10n.dart';

class AddReviewDialog extends StatefulWidget {
  const AddReviewDialog({super.key, required this.productId});
  final String productId;

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  bool submit = false;

  final TextEditingController _commentController = TextEditingController();
  double _rate = 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddReviewsCubit(getIt.get<HomeRepo>()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedCrossFade(
            firstChild: AddReviewForm(
              commentController: _commentController,
              onRateChanged: (value) {
                _rate = value;
              },
            ),
            secondChild: const AfterReview(),
            crossFadeState:
                !submit ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
          BlocConsumer<AddReviewsCubit, AddReviewsState>(
            listener: (context, state) {
              if (state is AddReviewSuccess) {
                submit = true;
                setState(() {});
              } else if (state is AddReviewsFailuer) {
                showNotification(context, state.errMessage, NotiType.error);
              }
            },
            builder:
                (context, state) => CustomButton(
                  isLoading: state is AddReviewsLoading,
                  title:
                      submit ? S.of(context).cancle : S.of(context).addReview,
                  onPressed: () async {
                    if (submit) {
                      Navigator.pop(context, true);
                    } else {
                      final comment = _commentController.text.trim();
                      final rate = _rate;

                      if (rate == 0.0) {
                        showNotification(
                          context,
                          'يجب اضافة تقييم',
                          NotiType.warning,
                        );
                        return;
                      }
                      if (comment.isEmpty) {
                        showNotification(
                          context,
                          'يجب اضافة تعليق',
                          NotiType.warning,
                        );
                        return;
                      }
                      await context.read<AddReviewsCubit>().addReview(
                        id: widget.productId,
                        comment: comment,
                        rate: rate.toInt(),
                      );
                    }
                  },
                ),
          ),
        ],
      ),
    );
  }
}

class AddReviewForm extends StatelessWidget {
  final TextEditingController commentController;
  final ValueChanged<double> onRateChanged;
  const AddReviewForm({
    super.key,
    required this.commentController,
    required this.onRateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50,
          child:
              SecureStorage.getUserData().image == null
                  ? Image.asset(Assets.imagesProfileImage, width: 50)
                  : Container(
                    width: 80,
                    height: 80,
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
        ),
        const SpaceV(10),
        Text(
          SecureStorage.getUserData().name!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).addRate,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder:
              (context, _) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: onRateChanged,
        ),
        const SpaceV(16),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            hintText: S.of(context).addRate3,
            hintStyle: TextStyles.semiBold16.copyWith(color: Colors.grey),
            fillColor: const Color.fromARGB(228, 253, 253, 253),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          maxLines: 1,
        ),
        const SpaceV(16),
      ],
    );
  }
}
