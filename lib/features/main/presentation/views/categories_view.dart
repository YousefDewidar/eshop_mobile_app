import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/categories/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(getIt.get<HomeRepo>())..getAllCategories(),
      child: const CategoriesViewBody(),
    );
  }
}
