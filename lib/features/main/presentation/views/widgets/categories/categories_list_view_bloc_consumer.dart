import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/main/domain/entities/category_entity.dart';
import 'package:rfaye3/features/main/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:rfaye3/features/main/presentation/manager/categories_cubit/categories_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/categories/categories_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesListViewBlocConsumer extends StatelessWidget {
  const CategoriesListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesFailure) {
          showNotification(context, state.message, NotiType.error);
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Skeletonizer.sliver(
            child: CategoriesListView(
              categories: dummyCategories,
            ),
          );
        } else if (state is CategoriesSuccess) {
          return CategoriesListView(
            categories: state.categories,
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
