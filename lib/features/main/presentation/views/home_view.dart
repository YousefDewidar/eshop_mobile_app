import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_seilling_cubit/most_seilling_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MostSeillingCubit(getIt.get<HomeRepo>())..getMostSeillingProducts(),
      child: const HomeViewBody(),
    );
  }
}
