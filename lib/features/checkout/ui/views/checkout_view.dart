import 'package:flutter/material.dart';
import 'package:rfaye3/features/checkout/ui/views/widgets/checkout_view_body.dart';
import 'package:rfaye3/features/main/domain/entities/cart_item_entity.dart';

class CheckoutView extends StatelessWidget {
  final List<CartItemEntity> cartList;

  const CheckoutView({super.key, required this.cartList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CheckoutViewBody(
          cartList: cartList,
        ),
      ),
    );
  }
}
