import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/data/models/review_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/reviews_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/reviews_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/review_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReviewsListViewBlocConsumer extends StatefulWidget {
  const ReviewsListViewBlocConsumer({super.key, required this.pID});
  final String pID;

  @override
  State<ReviewsListViewBlocConsumer> createState() =>
      _ReviewsListViewBlocConsumerState();
}

class _ReviewsListViewBlocConsumerState
    extends State<ReviewsListViewBlocConsumer> {
  late final ScrollController scrollController;

  List<ReviewModel> reviewsList = [];
  int pageNum = 2;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isLoading = false;
      scrollController.addListener(() async {
        var maxPosition = scrollController.position.maxScrollExtent;
        var curPosition = scrollController.position.pixels;
        if (curPosition >= maxPosition * .7 && !isLoading) {
          isLoading = true;

          await context.read<ReviewsCubit>().getProductReviewsById(
            id: widget.pID,
            pageNum: pageNum++,
          );
          isLoading = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewsCubit, ReviewsState>(
      listener: (context, state) {
        if (state is ReviewsSuccess) {
          reviewsList.addAll(state.reviews);
        }
      },
      builder: (context, state) {
        if (state is ReviewsFailuer) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else if (state is ReviewsLoading) {
          return const LoadingReviewsList();
        } else if (state is ReviewsSuccess) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 800,
              child: ListView.builder(
                controller: scrollController,
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
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}

class LoadingReviewsList extends StatelessWidget {
  const LoadingReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
