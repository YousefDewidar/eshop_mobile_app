import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/most_selling/add_to_cart_floating_button.dart';
import 'package:rfaye3/generated/l10n.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetailsView,
          arguments: {
            'product': product,
            "cartCubit": context.read<CartCubit>(),
          },
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.stock == 0)
                  Container(
                    width: double.infinity,
                    color: Colors.red,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      S.of(context).outOfStock,
                      textAlign: TextAlign.center,
                      style: TextStyles.medium15.copyWith(color: Colors.white),
                    ),
                  ),

                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: product.coverPictureUrl,
                      width: double.infinity,

                      fit: BoxFit.fill,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: TextStyles.semiBold13),
                            const SpaceV(4),
                            Text(
                              "${product.price} ${S.of(context).egp}",
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      product.stock == 0
                          ? const SizedBox()
                          : AddToCartFloatingButton(
                            isArabic: isArabic,
                            product: product,
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
