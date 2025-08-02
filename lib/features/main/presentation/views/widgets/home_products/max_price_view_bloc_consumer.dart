import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/Max_pricing_cubit/Max_pricing_state.dart';
import 'package:rfaye3/features/main/presentation/view_model/max_pricing_cubit/max_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/view_more_products_view.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/products_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MaxPriceListViewBlocConsumer extends StatelessWidget {
  const MaxPriceListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaxPriceCubit, MaxPriceState>(
      listener: (context, state) {
        if (state is MaxPriceFailure) {
          showNotification(context, state.message, NotiType.error);
        }
      },
      builder: (context, state) {
        if (state is MaxPriceLoading) {
          return Skeletonizer.sliver(
            child: ProductsListView(
              type: ViewMoreType.maxPrice,

              title: "fsvad",
              products: [
                ...List.generate(6, (index) => ProductModel.getDummyProduct()),
              ],
            ),
          );
        } else if (state is MaxPriceSuccess) {
          return ProductsListView(
            type: ViewMoreType.maxPrice,

            title: "أفضل المنتجات",
            products: state.products,
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
