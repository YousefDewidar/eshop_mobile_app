import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/main/data/models/category_model.dart';
import 'package:rfaye3/features/main/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/categories_cubit/categories_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/categories/categories_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesListViewBlocConsumer extends StatelessWidget {
  const CategoriesListViewBlocConsumer({super.key});

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
              categories: [
                ...List.generate(
                  6,
                  (index) => CategoryModel(
                    id: "",
                    name: "avadscvadvasd",
                    description: '',
                    coverPictureUrl: '',
                  ),
                ),
              ],
            ),
          );
        } else if (state is CategoriesSuccess) {
          return state.categories.isEmpty
              ? const SliverToBoxAdapter(
                child: Text("لا يوجد فئات", textAlign: TextAlign.center),
              )
              : CategoriesListView(categories: state.categories);
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
