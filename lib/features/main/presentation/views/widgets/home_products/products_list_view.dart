import 'package:flutter/material.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_text_with_view_more.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/presentation/views/view_more_products_view.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/product_card.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
    required this.products,
    required this.title,
    required this.type,
  });

  final List<ProductModel> products;
  final String title;
  final ViewMoreType type;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: Column(
          children: [
            CustomTextWithViewMore(
              title: title,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.mostSelling,
                  arguments: {
                    "products": products,
                    "title": title,
                    "type": type,
                  },
                );
              },
            ),
            const SpaceV(16),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length > 10 ? 10 : products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
                    child: SizedBox(
                      height: 224,
                      width: 180,
                      child: ProductCard(product: products[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
