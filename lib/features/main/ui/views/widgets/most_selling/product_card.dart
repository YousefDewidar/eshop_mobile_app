// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/fav_icon.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/domain/entities/cart_item_entity.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';
import 'package:rfaye3/features/main/ui/manager/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/generated/l10n.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xffF3F5F7)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpaceV(6),
                Center(
                  child: CachedNetworkImage(
                    imageUrl: product.img,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  product.title,
                  style: TextStyles.semiBold13,
                ),
                const SpaceV(4),
                Row(
                  children: [
                    Text(
                      "${product.price}${S.of(context).egp} / ",
                      style: TextStyles.bold13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Text(
                      S.of(context).kilo,
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lightSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const FavIcon(),
          Positioned(
            bottom: 16,
            left: 10,
            child: InkWell(
              onTap: () {
                showNotification(
                  context,
                  'تم اضافة ${product.title} إلي السلة',
                  NotiType.success,
                );
                context.read<CartCubit>().addToCart(
                      CartItemEntity(product: product),
                    );
              },
              child: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
