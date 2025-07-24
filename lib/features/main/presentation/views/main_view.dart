import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/widgets/custom_nav_bar.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/home_view.dart';
import 'package:rfaye3/features/cart/presentation/views/cart_view.dart';
import 'package:rfaye3/features/main/presentation/views/categories_view.dart';
import 'package:rfaye3/features/profile/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int curPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>())..getAllCartList(),
      child: Scaffold(
        bottomNavigationBar: CustomButtomNavBar(
          onTap: (value) {
            curPage = value;
            setState(() {});
          },
        ),
        body: SafeArea(
          child: LazyIndexedStack(
            index: curPage,
            children: const [
              HomeView(),
              CategoriesView(),
              CartView(),
              ProfileView(),
            ],
          ),
        ),
      ),
    );
  }
}
