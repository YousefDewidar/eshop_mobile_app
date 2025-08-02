import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/icon_back.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/max_pricing_cubit/max_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/view_more_product_view_body.dart';

enum ViewMoreType { minPrice, jewelry, mostRating, maxPrice }

class ViewMoreProductsView extends StatelessWidget {
  const ViewMoreProductsView({
    super.key,
    required this.products,
    required this.title,
    required this.type,
  });
  final List<ProductModel> products;
  final String title;
  final ViewMoreType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0,
        elevation: 60,

        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: IconsBack(),
        ),
        leadingWidth: 70,
        title: Text(
          title,
          style: TextStyles.bold19.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(child: _wrapWithCubit(products, title)),
    );
  }

  Widget _wrapWithCubit(List<ProductModel> products, String title) {
    switch (type) {
      case ViewMoreType.minPrice:
        return BlocProvider(
          create: (_) => MinPriceCubit(getIt.get<HomeRepo>()),
          child: ViewMoreProductsViewBody(
            title: title,
            products: products,
            type: type,
          ),
        );
      case ViewMoreType.jewelry:
        log("message");
        return BlocProvider(
          create: (_) => GoldProductsCubit(getIt.get<HomeRepo>()),
          child: ViewMoreProductsViewBody(
            title: title,
            products: products,
            type: type,
          ),
        );
      case ViewMoreType.maxPrice:
        return BlocProvider(
          create: (_) => MaxPriceCubit(getIt.get<HomeRepo>()),
          child: ViewMoreProductsViewBody(
            title: title,
            products: products,
            type: type,
          ),
        );
      case ViewMoreType.mostRating:
        return BlocProvider(
          create: (_) => MostRateCubit(getIt.get<HomeRepo>()),
          child: ViewMoreProductsViewBody(
            title: title,
            products: products,
            type: type,
          ),
        );
    }
  }
}
