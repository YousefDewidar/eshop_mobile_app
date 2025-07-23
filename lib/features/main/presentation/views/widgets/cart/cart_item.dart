import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/cart_item_entity.dart';
import 'package:rfaye3/features/main/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/cart/add_minus_product.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});
  final CartItemEntity product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
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
                imageUrl: product.product.coverPictureUrl,
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
                Text(product.product.name, style: TextStyles.bold13),
                const SpaceV(6),
                Text(
                  '${product.calcWeight()} ${S.of(context).kilogram}',
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const SpaceV(16),
                AddMinusProduct(product: product),
              ],
            ),
          ),

          IntrinsicHeight(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showNotification(
                        context,
                        'تم إزالة المنتج من السلة',
                        NotiType.warning,
                      );
                      context.read<CartCubit>().removeItem(product);
                    },
                    child: SvgPicture.asset(Assets.imagesTrash),
                  ),
                  Text(
                    '${product.calcTotalPriceForItem()} ${S.of(context).egp}',
                    style: TextStyles.bold16.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
