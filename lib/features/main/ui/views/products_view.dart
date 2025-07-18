import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/domain/repo/home_repo.dart';
import 'package:rfaye3/features/main/ui/manager/products_cubit/products_cubit.dart';
import 'package:rfaye3/features/main/ui/views/widgets/products/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt.get<HomeRepo>())..getAllProducts(),
      child: const ProductsViewBody(),
    );
  }
}
