import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class AddMinusProduct extends StatefulWidget {
  const AddMinusProduct({super.key, required this.product});
  final CartProductModel product;

  @override
  State<AddMinusProduct> createState() => _AddMinusProductState();
}

class _AddMinusProductState extends State<AddMinusProduct> {
  bool addLoading = false;
  bool removeLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap:
              addLoading
                  ? null
                  : () async {
                    addLoading = true;
                    setState(() {});
                    if (widget.product.quantity >=
                        widget.product.productStock) {
                      showNotification(
                        context,
                        "الكمية غير متاحة",
                        NotiType.warning,
                      );
                      addLoading = false;
                      setState(() {});
                      return;
                    }
                    await context.read<CartCubit>().addToCart(
                      widget.product.productId,
                    );
                    addLoading = false;
                    setState(() {});
                  },
          radius: 12,
          borderRadius: BorderRadius.circular(12),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.primaryColor,
            child:
                addLoading
                    ? Lottie.asset("assets/animations/Loading.json")
                    : const Icon(Icons.add, size: 18, color: Colors.white),
          ),
        ),
        const SpaceH(16),
        Text(widget.product.quantity.toString(), style: TextStyles.bold16),
        const SpaceH(16),
        InkWell(
          onTap:
              removeLoading
                  ? null
                  : () async {
                    removeLoading = true;
                    setState(() {});
                    await context.read<CartCubit>().removeOneFromCart(
                      widget.product.itemId,
                    );
                    removeLoading = false;
                    setState(() {});
                  },
          radius: 12,
          borderRadius: BorderRadius.circular(12),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child:
                removeLoading
                    ? Lottie.asset("assets/animations/Loading.json")
                    : const Icon(
                      Icons.remove,
                      size: 18,
                      color: Color(0xff979899),
                    ),
          ),
        ),
      ],
    );
  }
}
