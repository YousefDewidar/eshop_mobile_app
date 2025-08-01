import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/data/models/review_model.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/review_item.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reviewsList});
  final List<ReviewModel> reviewsList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 1000,
        child: ListView.builder(
          itemCount: reviewsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHoripadding,
                vertical: 10,
              ),
              child: ReviewItem(review: reviewsList[index]),
            );
          },
        ),
      ),
    );
  }
}
