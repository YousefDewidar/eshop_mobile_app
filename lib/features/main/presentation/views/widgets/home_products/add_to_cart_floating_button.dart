import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart' show Lottie;
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_state.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';

class AddToCartFloatingButton extends StatefulWidget {
  const AddToCartFloatingButton({
    super.key,
    required this.isArabic,
    required this.product,
  });

  final bool isArabic;
  final ProductModel product;


  @override
  State<AddToCartFloatingButton> createState() =>
      _AddToCartFloatingButtonState();
}

class _AddToCartFloatingButtonState extends State<AddToCartFloatingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartLoading && state.productId == widget.product.id) {
          setState(() {
            isLoading = true;
          });
        } else if ((state is CartLoaded || state is CartFail) && isLoading) {
          setState(() {
            isLoading = false;
          });
        }

        if (state is CartFail) {
          showNotification(context, state.error, NotiType.error);
        }
      },
      builder:
          (context, state) => GestureDetector(
            onTap: () {
              if (!isLoading) {
                context.read<CartCubit>().addToCart(widget.product.id);
              }
            },
            child: Container(
              width: 33.0,
              height: 33.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child:
                    isLoading
                        ? Lottie.asset("assets/animations/Loading.json")
                        : Icon(
                          Icons.add_shopping_cart,
                          color: Colors.grey.shade700,
                          size: 22.0,
                        ),
              ),
            ),
          ),
    );
  }
}
