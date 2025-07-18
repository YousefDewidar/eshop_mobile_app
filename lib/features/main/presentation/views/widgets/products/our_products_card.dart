import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';

class OurProductCard extends StatelessWidget {
  const OurProductCard({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: const Color(0xffF3F5F7),
            child: Padding(
              padding: const EdgeInsets.all(6),
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
          ),
          const SizedBox(height: 8),
          Text(product.title)
        ],
      ),
    );
  }
}
