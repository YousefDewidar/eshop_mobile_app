import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class AddMinusProduct extends StatelessWidget {
  const AddMinusProduct({super.key, required this.product});
  final CartProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.read<CartCubit>().addToCart(product.productId);
          },
          radius: 12,
          borderRadius: BorderRadius.circular(12),
          child: const CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.add, size: 18, color: Colors.white),
          ),
        ),
        const SpaceH(16),
        Text(product.quantity.toString(), style: TextStyles.bold16),
        const SpaceH(16),
        InkWell(
          onTap: () {
            context.read<CartCubit>().removeOneFromCart(product.itemId);
          },
          radius: 12,
          borderRadius: BorderRadius.circular(12),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(Icons.remove, size: 18, color: Color(0xff979899)),
          ),
        ),
      ],
    );
  }
}
