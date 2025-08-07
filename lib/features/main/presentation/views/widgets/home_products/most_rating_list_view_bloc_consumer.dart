import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_state.dart';
import 'package:rfaye3/features/main/presentation/views/view_more_products_view.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/products_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MostRateingListViewBlocConsumer extends StatelessWidget {
  const MostRateingListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MostRateCubit, MostRateState>(
      listener: (context, state) {
        if (state is MostRateFailure) {
          showNotification(context, state.message, NotiType.error);
        }
      },
      builder: (context, state) {
        if (state is MostRateLoading) {
          return Skeletonizer.sliver(
            child: ProductsListView(
              type: ViewMoreType.mostRating,

              title: 'شسرشيس',
              products: [
                ...List.generate(6, (index) => ProductModel.getDummyProduct()),
              ],
            ),
          );
        } else if (state is MostRateSuccess) {
          if (state.products.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }
          return ProductsListView(
            type: ViewMoreType.mostRating,
            title: "الأعلي تقيما",
            products: state.products,
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
