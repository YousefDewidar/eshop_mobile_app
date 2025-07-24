import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_state.dart';
import 'package:rfaye3/features/cart/presentation/views/widgets/cart_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Expanded(
            child: ListView.separated(
              itemCount: state.cartList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
                  child: CartCard(product: state.cartList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(color: Color(0xffF1F1F5));
              },
            ),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 30),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHoripadding,
                  ),
                  child: CartCard(
                    product: CartProductModel(
                      itemId: "dv",
                      productId: "dv",
                      productCoverUrl: "dv",
                      quantity: 1,
                      pricePerUnit: 5,
                      productStock: 5,
                      totalPriceForItem: 2,
                      weightInGrams: 2,
                      productName: "dverghtrherwthw",
                    ),
                  ),
              
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(color: Color(0xffF1F1F5));
              },
            ),
          );
        }
      },
    );
  }
}
