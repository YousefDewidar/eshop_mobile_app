import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';
import 'package:rfaye3/features/main/ui/views/widgets/products/our_products_card.dart';

class OurProductsListView extends StatelessWidget {
  const OurProductsListView({
    super.key,
    required this.products,
  });
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
          itemBuilder: (context, index) {
            return OurProductCard(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}
