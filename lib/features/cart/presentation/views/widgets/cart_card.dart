import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_state.dart';
import 'package:rfaye3/features/cart/presentation/views/widgets/add_minus_product.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.product});
  final CartProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // product Image
        Expanded(
          flex: 1,
          child: Container(
            width: 73,
            height: 100,
            padding: const EdgeInsets.all(5),
            color: Theme.of(context).colorScheme.surface,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: product.productCoverUrl,
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
              errorWidget:
                  (context, url, error) => const Center(
                    child: Icon(Icons.image_not_supported_outlined, size: 50),
                  ),
            ),
          ),
        ),

        const SpaceH(17),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.productName, style: TextStyles.bold13),
              const SpaceV(6),
              Text(
                '${product.weightInGrams} ${S.of(context).gram}',
                style: TextStyles.regular13.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              const SpaceV(16),
              AddMinusProduct(product: product),
            ],
          ),
        ),

        SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocListener<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is CartFail) {
                    showNotification(context, state.error, NotiType.error);
                  } else if (state is RemovedFromCart) {
                    showNotification(
                      context,
                      'تم إزالة المنتج من السلة',
                      NotiType.warning,
                    );
                  }
                },
                child: InkWell(
                  onTap: () async {
                    await context.read<CartCubit>().removeItem(
                      product.itemId,
                    );
                  },
                  child: SvgPicture.asset(Assets.imagesTrash),
                ),
              ),
              Text(
                '${product.totalPriceForItem.toStringAsFixed(2)} ${S.of(context).egp}',
                style: TextStyles.bold16.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
