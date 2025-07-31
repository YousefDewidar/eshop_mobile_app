import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/max_pricing_cubit/max_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GoldProductsCubit(getIt.get<HomeRepo>()),
        ),
        BlocProvider(
          create: (context) => MostRateCubit((getIt.get<HomeRepo>())),
        ),
        BlocProvider(
          create: (context) => MinPriceCubit((getIt.get<HomeRepo>())),
        ),
        BlocProvider(
          create: (context) => MaxPriceCubit((getIt.get<HomeRepo>())),
        ),
      ],

      child: const HomeViewBody(),
    );
  }
}
