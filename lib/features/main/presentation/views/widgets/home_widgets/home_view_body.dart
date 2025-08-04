import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/presentation/view_model/max_pricing_cubit/max_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/offers_cubit/offers_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/gold_products_list_view_bloc_consumer.dart';
import 'package:rfaye3/core/widgets/search_text_field.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/max_price_view_bloc_consumer.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/min_price_view_bloc_consumer.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/most_rating_list_view_bloc_consumer.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/home_app_bar.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/offer_list_view.dart';
import 'package:rfaye3/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<GoldProductsCubit>().getGoldProdcuts(),
      context.read<MostRateCubit>().getMostRateProducts(),
      context.read<MinPriceCubit>().getMinPriceProducts(),
      context.read<MaxPriceCubit>().getMaxPriceProducts(),
      context.read<OffersCubit>().getAllOffers(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([
          context.read<GoldProductsCubit>().getGoldProdcuts(),
          context.read<MostRateCubit>().getMostRateProducts(),
          context.read<MinPriceCubit>().getMinPriceProducts(),
          context.read<MaxPriceCubit>().getMaxPriceProducts(),
          context.read<OffersCubit>().getAllOffers(),
        ]);
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SpaceV(16),
                  SearchTextField(
                    enabled: false,
                    hint: S.of(context).homeSearchHint,
                  ),
                  const SpaceV(12),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: OfferListView()),
          const SliverToBoxAdapter(child: SpaceV(16)),

          const MinPriceListViewBlocConsumer(),
          const SliverToBoxAdapter(child: SpaceV(16)),
          const GoldProductsListViewBlocConsumer(),
          const SliverToBoxAdapter(child: SpaceV(16)),

          const MostRateingListViewBlocConsumer(),

          const SliverToBoxAdapter(child: SpaceV(16)),
          const MaxPriceListViewBlocConsumer(),
          const SliverToBoxAdapter(child: SpaceV(16)),
        ],
      ),
    );
  }
}
