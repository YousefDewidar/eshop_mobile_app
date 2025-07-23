import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:rfaye3/features/cart/data/models/cart_item_model.dart';

class CheckoutView extends StatelessWidget {
  final List<CartItemModel> cartList;

  const CheckoutView({super.key, required this.cartList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AddressCubit(getIt.get<CheckoutRepo>())..getAllAddress(),
      child: Scaffold(
        body: SafeArea(child: CheckoutViewBody(cartList: cartList)),
      ),
    );
  }
}
