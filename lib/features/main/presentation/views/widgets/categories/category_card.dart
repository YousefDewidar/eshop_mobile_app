import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/features/main/data/models/category_model.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: CachedNetworkImage(
              imageUrl:
                  "https://www.iomm.org.my/wp-content/uploads/2019/11/imm_logo-removebg-preview.png",
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
          const SizedBox(height: 8),
          Text(category.name, style: TextStyles.bold16),
        ],
      ),
    );
  }
}
