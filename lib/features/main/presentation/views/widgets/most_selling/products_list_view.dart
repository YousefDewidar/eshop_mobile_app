import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/most_selling/product_card.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length > 10 ? 10 : products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: SizedBox(
                  height: 220,
                  width: 200,
                  child: ProductCard(product: products[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
