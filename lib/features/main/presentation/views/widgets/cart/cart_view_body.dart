import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/cart/cart_list_view.dart';
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
          color: const Color(0xFFEBF9F1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "${S.current.haveProductsInCart1} ${context.watch<CartCubit>().totalCount} ${S.current.haveProductsInCart2}",
              textAlign: TextAlign.center,
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF1B5E37),
              ),
            ),
          ),
        ),
        const SpaceV(15),
        const CartListView(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
          child: CustomButton(
            isEnabled: context.read<CartCubit>().cartList.isNotEmpty,
            title:
                "${S.of(context).checkout} ${context.watch<CartCubit>().totalPrice} ${S.of(context).egp}",
            onPressed: () {
              if (context.read<CartCubit>().cartList.isEmpty) return;
              Navigator.pushNamed(
                context,
                Routes.checkout,
                arguments: context.read<CartCubit>().cartList,
              );
            },
          ),
        ),
        const SpaceV(10),
      ],
    );
  }
}
