import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/search/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.q});
  final String? q;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (q != null) {
          return SearchCubit(getIt.get<HomeRepo>())
            ..searchProducts(catName: q!, query: '');
        } else {
          return SearchCubit(getIt.get<HomeRepo>());
        }
      },
      child: const Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}
