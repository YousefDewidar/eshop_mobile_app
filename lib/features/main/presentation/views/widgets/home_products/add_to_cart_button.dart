import 'package:flutter/material.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/generated/l10n.dart';

class AddToCartButtonWithAnimation extends StatefulWidget {
  final CartCubit cartCubit;
  final String productId;
  final bool isEnabled;

  const AddToCartButtonWithAnimation({
    super.key,
    required this.cartCubit,
    required this.productId,
    required this.isEnabled,
  });

  @override
  State<AddToCartButtonWithAnimation> createState() =>
      _AddToCartButtonWithAnimationState();
}

class _AddToCartButtonWithAnimationState
    extends State<AddToCartButtonWithAnimation> {
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;

  @override
  Widget build(BuildContext context) {
    CartProductModel? product;
    try {
      product = widget.cartCubit.cartList.firstWhere(
        (element) => element.productId == widget.productId,
      );
    } catch (e) {
      product = null;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            AddToCartButton(
              trolley: Image.asset(
                Assets.imagesIcCart,
                width: 24,
                height: 24,
                color: Colors.white,
              ),
              text: Text(
                widget.isEnabled
                    ? S.of(context).addToCart
                    : S.of(context).outOfStock,

                textAlign: TextAlign.center,
                style: TextStyles.bold16.copyWith(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
              check: const SizedBox(
                width: 48,
                height: 48,
                child: Icon(Icons.check, color: Colors.white, size: 24),
              ),
              borderRadius: BorderRadius.circular(24),
              backgroundColor:
                  widget.isEnabled
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
              onPressed: (id) async {
                if (!widget.isEnabled) return;
                if (id == AddToCartButtonStateId.idle) {
                  setState(() {
                    stateId = AddToCartButtonStateId.loading;
                  });
                  await widget.cartCubit.addToCart(widget.productId);

                  await Future.delayed(const Duration(seconds: 2), () {});
                  setState(() {
                    stateId = AddToCartButtonStateId.done;
                  });
                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      stateId = AddToCartButtonStateId.idle;
                    });
                  });
                }
              },
              stateId: stateId,
            ),
            if (product != null &&
                stateId == AddToCartButtonStateId.idle &&
                product.quantity > 0)
              Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: const Color.fromARGB(249, 255, 255, 255),
                  child: Text(
                    product.quantity.toString(),
                    style: TextStyles.semiBold13,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
