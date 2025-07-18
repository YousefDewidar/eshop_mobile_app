import 'package:flutter/material.dart';
import 'package:rfaye3/features/checkout/ui/views/widgets/address_section.dart';
import 'package:rfaye3/features/checkout/ui/views/widgets/payment_section.dart';
import 'package:rfaye3/features/checkout/ui/views/widgets/review_section.dart';
import 'package:rfaye3/features/checkout/ui/views/widgets/shipping_section.dart';


class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  List<Widget> checkoutSections() => const [
        ShippingSection(),
        AddressSection(),
        PaymentSection(),
        ReviewSection(),
      ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return checkoutSections()[index];
        },
      ),
    );
  }
}
