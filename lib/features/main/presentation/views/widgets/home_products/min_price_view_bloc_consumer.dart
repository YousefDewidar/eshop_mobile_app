import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/products_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MinPriceListViewBlocConsumer extends StatelessWidget {
  const MinPriceListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MinPriceCubit, MinPriceState>(
      listener: (context, state) {
        if (state is MinPriceFailure) {
          showNotification(context, state.message, NotiType.error);
        }
      },
      builder: (context, state) {
        if (state is MinPriceLoading) {
          return Skeletonizer.sliver(
            child: ProductsListView(
              title: "adadv",
              products: [
                ...List.generate(6, (index) => ProductModel.getDummyProduct()),
              ],
            ),
          );
        } else if (state is MinPriceSuccess) {
          return ProductsListView(
            title: "أفضل الأسعار",
            products: state.products,
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
