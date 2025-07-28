import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_seilling_cubit/most_seilling_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_seilling_cubit/most_seilling_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/most_selling/most_selling_list_view_bloc_consumer.dart';
import 'package:rfaye3/core/widgets/search_text_field.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/home_app_bar.dart';
import 'package:rfaye3/core/widgets/custom_text_with_view_more.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/offer_list_view.dart';
import 'package:rfaye3/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<MostSeillingCubit>().getMostSeillingProducts();
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
          SliverToBoxAdapter(
            child: BlocBuilder<MostSeillingCubit, MostSeillingState>(
              builder: (context, state) {
                return CustomTextWithViewMore(
                  title: S.of(context).mostPop,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.mostSelling,
                      arguments:
                          state is MostSeillingSuccess ? state.products : [],
                    );
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SpaceV(16)),

          const MostSellingListViewBlocConsumer(),
          const SliverToBoxAdapter(child: SpaceV(16)),
          SliverToBoxAdapter(
            child: CustomTextWithViewMore(title: "افضل العروض", onTap: () {}),
          ),
          const SliverToBoxAdapter(child: SpaceV(16)),
          SliverToBoxAdapter(
            child: CustomTextWithViewMore(title: "مقترحة لك", onTap: () {}),
          ),
          const SliverToBoxAdapter(child: SpaceV(16)),
        ],
      ),
    );
  }
}
