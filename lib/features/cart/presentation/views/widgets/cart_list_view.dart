import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/cart/presentation/views/widgets/cart_card.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: context.watch<CartCubit>().cartList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
            child: CartCard(product: context.read<CartCubit>().cartList[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Color(0xffF1F1F5));
        },
      ),
    );
  }
}
