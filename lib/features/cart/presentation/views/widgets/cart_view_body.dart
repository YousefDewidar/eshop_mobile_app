import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/cart/presentation/views/widgets/cart_list_view.dart';
import 'package:rfaye3/features/cart/presentation/views/widgets/success_order_bottom_sheet.dart';
import 'package:rfaye3/generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).cart,
          textAlign: TextAlign.center,
          style: TextStyles.bold19,
        ),
        const SpaceV(26),
        Container(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "${S.current.haveProductsInCart1} ${context.watch<CartCubit>().totalCount} ${S.current.haveProductsInCart2}",
              textAlign: TextAlign.center,
              style: TextStyles.regular13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        const SpaceV(15),
        const CartListView(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
          child: CustomButton(
            isEnabled: (context.read<CartCubit>().cartList.isNotEmpty),

            title:
                "${S.of(context).checkout} ${context.watch<CartCubit>().totalPrice.toStringAsFixed(2)} ${S.of(context).egp}",
            onPressed: () async {
              if (context.read<CartCubit>().cartList.isEmpty) return;
              if (checkAllProductsAveilable(context) != null) return;
              final orderDone =
                  await Navigator.pushNamed(
                        context,
                        Routes.checkout,
                        arguments: context.read<CartCubit>().totalPrice,
                      )
                      as bool?;
              if (orderDone == true && context.mounted) {
                await context.read<CartCubit>().getAllCartList();
                if (!context.mounted) return;
                if (context.read<CartCubit>().cartList.isEmpty) {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) => const SuccessOrderBottomSheet(),
                  );

                  // sa
                } else {
                  showNotification(context, "تم إلغاء الطلب", NotiType.error);
                }
              }
            },
          ),
        ),

        const SpaceV(10),
      ],
    );
  }

  String? checkAllProductsAveilable(BuildContext context) {
    String? productNotAveilable;
    context.read<CartCubit>().cartList.forEach((element) {
      if (element.productStock == 0) {
        productNotAveilable = element.productName;
        showNotification(
          context,
          "$productNotAveilable ${S.of(context).notAvailable}",
          NotiType.warning,
        );
      } else if (element.quantity > element.productStock) {
        productNotAveilable = element.productName;
        showNotification(
          context,
          "المتبقي من $productNotAveilable هو ${element.productStock} قطعة",
          NotiType.warning,
        );
      }
    });

    return productNotAveilable;
  }
}
