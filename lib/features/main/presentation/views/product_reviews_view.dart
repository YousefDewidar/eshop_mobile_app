import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/reviews_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/reviews/product_review_view_body.dart';

class ProductReviewsView extends StatelessWidget {
  const ProductReviewsView({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ReviewsCubit(getIt.get<HomeRepo>())
                ..getProductReviewsById(id: product.id),
      child: ProductReviewsViewBody(product: product),
    );
  }
}
