import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/product_card.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/app_bar_with_notification.dart';

class ViewMoreProductsViewBody extends StatelessWidget {
  final List<ProductModel> products;
  final String title;
  const ViewMoreProductsViewBody({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        AppBarWithNotification(title: title, hasNoti: false),
        const SliverToBoxAdapter(child: SpaceV(16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
          sliver: SliverToBoxAdapter(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: customDelegate(),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ),
      ],
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
