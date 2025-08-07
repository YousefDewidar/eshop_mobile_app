import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_state.dart';
import 'package:rfaye3/features/main/presentation/views/view_more_products_view.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/products_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GoldProductsListViewBlocConsumer extends StatelessWidget {
  const GoldProductsListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoldProductsCubit, GoldProductsState>(
      listener: (context, state) {
        if (state is GoldProductsFailure) {
          showNotification(context, state.message, NotiType.error);
        }
      },
      builder: (context, state) {
        if (state is GoldProductsLoading) {
          return Skeletonizer.sliver(
            child: ProductsListView(
              type: ViewMoreType.jewelry,
              title: "scva",
              products: [
                ...List.generate(6, (index) => ProductModel.getDummyProduct()),
              ],
            ),
          );
        } else if (state is GoldProductsSuccess) {
          if (state.products.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }
          return ProductsListView(
            type: ViewMoreType.jewelry,
            title: "منتجات المجوهرات",
            products: state.products,
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
