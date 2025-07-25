
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/icon_back.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/generated/l10n.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
    required this.cartCubit,
  });
  final ProductModel product;
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.imagesElieps,
                  color: Theme.of(context).colorScheme.surface,
                ),

                CachedNetworkImage(
                  imageUrl: product.coverPictureUrl,
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.contain,
                  placeholder:
                      (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                  errorWidget:
                      (context, url, error) => const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                        ),
                      ),
                ),

                Positioned.directional(
                  textDirection: Directionality.of(context),
                  start: 10,
                  top: 20,
                  child: const IconsBack(),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(kHoripadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: TextStyles.semiBold13),
                          const SpaceV(4),
                          Text(
                            "${product.price}${S.of(context).egp}",
                            style: TextStyles.bold13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          Text(
                            "${S.of(context).weight}: ${product.weight}",
                            style: TextStyles.bold13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SpaceV(10),
                  Row(
                    spacing: 8,
                    children: [
                      const Icon(Icons.star, color: AppColors.secondaryColor),

                      // Text(
                      //   product.r.toString(),
                      //   style: TextStyles.semiBold13,
                      // ),
                      // Text(
                      //   "(${product.rateCount}+)",
                      //   style: TextStyles.semiBold13,
                      // ),
                      Text(
                        S.of(context).review,
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.lightPrimaryColor,
                          decorationColor: AppColors.lightPrimaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SpaceV(10),
                  Text(
                    product.description,
                    style: TextStyles.regular13.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  isEnabled: product.stock == 0 ? false : true,
                  title:
                      product.stock == 0
                          ? S.of(context).outOfStock
                          : S.of(context).addToCart,
                  onPressed: () {
                    cartCubit.addToCart(product.id);
                    showNotification(
                      context,
                      'تم اضافة ${product.name} إلي السلة',
                      NotiType.success,
                    );
                  },
                ),
              ),
            ),

            const SpaceV(25),
          ],
        ),
      ),
    );
  }
}
