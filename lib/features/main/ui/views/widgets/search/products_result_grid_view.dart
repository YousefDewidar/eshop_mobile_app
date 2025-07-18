import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/ui/views/widgets/most_selling/product_card.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';

class ProductsResultGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsResultGridView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: customDelegate(),
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount customDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 8,
      childAspectRatio: 163 / 214,
    );
  }
}
