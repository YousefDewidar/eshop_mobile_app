import 'package:flutter/material.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/address_section_view.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/review_section.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({super.key, required this.pageController});

  final PageController pageController;

  List<Widget> checkoutSections() => const [
    ShippingSection(),
    AddressSectionView(),
    ReviewSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return checkoutSections()[index];
        },
      ),
    );
  }
}
