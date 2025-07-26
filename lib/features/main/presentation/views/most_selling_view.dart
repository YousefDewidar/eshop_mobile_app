import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/most_selling/most_selling_view_body.dart';

class MostSellingView extends StatelessWidget {
  const MostSellingView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>()),
      child: Scaffold(
        body: SafeArea(child: MostSellingViewBody(products: products)),
      ),
    );
  }
}
