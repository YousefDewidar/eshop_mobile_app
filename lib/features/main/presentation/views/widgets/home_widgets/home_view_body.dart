import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/most_selling/most_selling_grid_view_bloc_consumer.dart';
import 'package:rfaye3/core/widgets/search_text_field.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/home_app_bar.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/most_selling_text_row.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/offer_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
            child: Column(
              children: [
                const HomeAppBar(),
                const SpaceV(16),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.search),
                  child: const SearchTextField(enabled: false),
                ),
                const SpaceV(12),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: OfferListView(),
        ),
        const SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.only(
              left: kHoripadding,
              right: kHoripadding,
              top: 12,
              bottom: 8,
            ),
            child: MostSellingTextRow(),
          ),
        ),
        const MostSellingGridViewBlocConsumer(),
        const SliverToBoxAdapter(child: SpaceV(16)),
      ],
    );
  }
}
