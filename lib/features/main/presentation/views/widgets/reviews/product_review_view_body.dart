import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/data/models/review_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/reviews_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/reviews_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/app_bar_with_notification.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/add_review_dialog.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/add_review_feild.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/review_item.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/reviews_list_view.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductReviewsViewBody extends StatelessWidget {
  const ProductReviewsViewBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            AppBarWithNotification(title: S.of(context).review, hasNoti: false),
            const SliverToBoxAdapter(child: SpaceV(16)),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHoripadding,
                  vertical: 16,
                ),
                child: GestureDetector(
                  onTap: () async {
                    bool? res =
                        await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: AddReviewDialog(
                                    productId: product.id,
                                  ),
                                );
                              },
                            )
                            as bool?;
                    if (res == true && context.mounted) {
                      context.read<ReviewsCubit>().getProductReviewsById(
                        id: product.id,
                      );
                    }
                  },
                  child: const AddReviewFeild(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.reviewsCount} ${S.of(context).review2}",
                      style: TextStyles.bold16,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: AppColors.secondaryColor),
                        const SpaceH(5),
                        Text(
                          product.rating.toString(),
                          style: TextStyles.bold16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SpaceV(16)),

            BlocBuilder<ReviewsCubit, ReviewsState>(
              builder: (context, state) {
                if (state is ReviewsFailuer) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.errMessage)),
                  );
                } else if (state is ReviewsLoading) {
                  return Skeletonizer.sliver(
                    enabled: true,
                    child: SliverList.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kHoripadding,
                            vertical: 10,
                          ),
                          child: ReviewItem(
                            review: ReviewModel(
                              comment: "comment",
                              rating: 5,
                              createdAt: DateTime(2023),
                              userName: "userName",
                              userPicture: '',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ReviewsSuccess) {
                  return ReviewsListView(reviewsList: state.reviews);
                } else {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
