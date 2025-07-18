import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/search_text_field.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/most_selling/app_bar_with_notification.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/products/our_products_list_view_bloc_consumer.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/products/products_grid_view_bloc_consumer.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/products/sort_product.dart';
import 'package:rfaye3/generated/l10n.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AppBarWithNotification(
          title: S.of(context).products,
          hasBack: false,
        ),
        // search field
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
            child: Column(
              children: [
                const SpaceV(16),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.search),
                  child: const SearchTextField(enabled: false),
                ),
              ],
            ),
          ),
        ),
        const SortProducts(),
        const OurProductsListViewBlocConsumer(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: kHoripadding,
              right: kHoripadding,
              top: 12,
              bottom: 8,
            ),
            child: Text(
              S.of(context).all,
              style: TextStyles.bold16,
            ),
          ),
        ),
        const ProductsGridViewBlocConsumer(),
        const SliverToBoxAdapter(child: SpaceV(16)),
      ],
    );
  }
}
