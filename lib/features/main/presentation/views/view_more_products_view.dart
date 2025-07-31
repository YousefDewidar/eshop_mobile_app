import 'package:flutter/material.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/view_more_product_view_body.dart';

class ViewMoreProductsView extends StatelessWidget {
  const ViewMoreProductsView({
    super.key,
    required this.products,
    required this.title,
  });
  final List<ProductModel> products;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewMoreProductsViewBody(products: products, title: title),
      ),
    );
  }
}
