import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_state.dart';
import 'package:rfaye3/features/main/presentation/view_model/max_pricing_cubit/max_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/max_pricing_cubit/max_pricing_state.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_state.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_state.dart';
import 'package:rfaye3/features/main/presentation/views/view_more_products_view.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/product_card.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';

class ViewMoreProductsViewBody extends StatefulWidget {
  final List<ProductModel> products;
  final String title;
  final ViewMoreType type;
  const ViewMoreProductsViewBody({
    super.key,
    required this.products,
    required this.title,
    required this.type,
  });

  @override
  State<ViewMoreProductsViewBody> createState() =>
      _ViewMoreProductsViewBodyState();
}

class _ViewMoreProductsViewBodyState extends State<ViewMoreProductsViewBody> {
  late final ScrollController scrollController;

  List<ProductModel> productsList = [];
  int pageNum = 2;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    productsList.addAll(widget.products);
    log(productsList.length.toString());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isLoading = false;
      scrollController.addListener(() async {
        var maxPosition = scrollController.position.maxScrollExtent;
        var curPosition = scrollController.position.pixels;
        if (curPosition >= maxPosition * .7 && !isLoading) {
          isLoading = true;

          await _loadMore();

          isLoading = false;
        }
      });
    });
  }

  Future<void> _loadMore() async {
    switch (widget.type) {
      case ViewMoreType.minPrice:
        await context.read<MinPriceCubit>().getMinPriceProducts(
          pageNum: pageNum++,
        );
        break;
      case ViewMoreType.jewelry:
        await context.read<GoldProductsCubit>().getGoldProdcuts(
          pageNum: pageNum,
        );

        break;
      case ViewMoreType.maxPrice:
        await context.read<MaxPriceCubit>().getMaxPriceProducts(
          pageNum: pageNum++,
        );
        break;
      case ViewMoreType.mostRating:
        await context.read<MostRateCubit>().getMostRateProducts(
          pageNum: pageNum++,
        );
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        if (widget.type == ViewMoreType.maxPrice)
          BlocListener<MaxPriceCubit, MaxPriceState>(
            listener: (context, state) {
              if (state is MaxPriceSuccess) {
                productsList.addAll(state.products);
                setState(() {});
              }
            },
          ),
        if (widget.type == ViewMoreType.minPrice)
          BlocListener<MinPriceCubit, MinPriceState>(
            listener: (context, state) {
              if (state is MinPriceSuccess) {
                productsList.addAll(state.products);
                setState(() {});
              }
            },
          ),
        if (widget.type == ViewMoreType.jewelry)
          BlocListener<GoldProductsCubit, GoldProductsState>(
            listener: (context, state) {
              if (state is GoldProductsSuccess) {
                productsList.addAll(state.products);
                setState(() {});
              }
            },
          ),
        if (widget.type == ViewMoreType.mostRating)
          BlocListener<MostRateCubit, MostRateState>(
            listener: (context, state) {
              if (state is MostRateSuccess) {
                productsList.addAll(state.products);
                setState(() {});
              }
            },
          ),
      ],
      child: GridView.builder(
        padding: const EdgeInsets.all(kHoripadding),
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        itemCount: productsList.length,
        gridDelegate: customDelegate(),
        itemBuilder: (context, index) {
          return ProductCard(product: productsList[index]);
        },
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount customDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 8,
      childAspectRatio: 163 / 260,
    );
  }
}
