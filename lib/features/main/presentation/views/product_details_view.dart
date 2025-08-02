import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/icon_back.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/add_to_cart_button.dart';
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
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(180, 40),
                    bottomRight: Radius.elliptical(180, 40),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.coverPictureUrl,
                    width: MediaQuery.of(context).size.width,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.getProductNameByLang(context),
                        style: TextStyles.bold23,
                      ),
                      const SpaceV(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product.price} ${S.of(context).egp}",
                            style: TextStyles.bold23.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          Text(
                            "${S.of(context).weight}: ${product.weight} ${S.of(context).gram}",
                            style: TextStyles.semiBold16.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.secondaryColor),
                      Text(
                        product.rating.toStringAsFixed(2),
                        style: TextStyles.semiBold13,
                      ),
                      const SpaceH(5),
                      Text(
                        "(${product.reviewsCount})",
                        style: TextStyles.semiBold13,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.productReviewsView,
                            arguments: product,
                          );
                        },
                        child: Text(
                          S.of(context).review,
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightPrimaryColor,
                            decorationColor: AppColors.lightPrimaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    product.getProductDescByLang(context),
                    style: TextStyles.regular16.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            AddToCartButtonWithAnimation(
              cartCubit: cartCubit,
              productId: product.id,
              isEnabled: product.stock == 0 ? false : true,
            ),

            const SpaceV(25),
          ],
        ),
      ),
    );
  }
}
