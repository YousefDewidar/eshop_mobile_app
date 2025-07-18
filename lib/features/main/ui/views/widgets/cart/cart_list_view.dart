import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/domain/entities/cart_item_entity.dart';
import 'package:rfaye3/features/main/ui/manager/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/ui/views/widgets/cart/cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CartItemEntity> cartList = context.watch<CartCubit>().cartList;
    return Expanded(
      child: ListView.separated(
        itemCount: cartList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
            child: CartItem(product: cartList[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Color(0xffF1F1F5),
          );
        },
      ),
    );
  }
}
