import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/search_text_field.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/most_selling/app_bar_with_notification.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/categories/categories_list_view_bloc_consumer.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/categories/sort_product.dart';
import 'package:rfaye3/generated/l10n.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AppBarWithNotification(title: S.of(context).categories, hasBack: false),
        // search field
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
            child: Column(
              children: [
                const SpaceV(16),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.search),
                  child: SearchTextField(
                    enabled: false,
                    hint: S.of(context).homeSearchHint,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SortProducts(),
        const CategoriesListViewBlocConsumer(),

        // const ProductsGridViewBlocConsumer(),
        const SliverToBoxAdapter(child: SpaceV(16)),
      ],
    );
  }
}
