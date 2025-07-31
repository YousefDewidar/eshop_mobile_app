import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart' show Lottie;
import 'package:rfaye3/core/utils/app_colors.dart';
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
        if (state is AddToCartLoading &&
            state.productId == widget.product.id) {
          isLoading = true;
        } else if (state is CartLoaded) {
          isLoading = false;
        }
        if (state is CartFail) {
          isLoading = false;
          showNotification(context, state.error, NotiType.error);
        }
      },
      builder:
          (context, state) => InkWell(
            onTap: () {
              context.read<CartCubit>().addToCart(widget.product.id);
            },
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child:
                  isLoading
                      ? Lottie.asset("assets/animations/Loading.json")
                      : const Icon(Icons.add, color: Colors.white),
            ),
          ),
    );
  }
}
