
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/address_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/payment_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/price_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/review_card.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceV(10),
        Text("ملخص الطلب :", style: TextStyles.bold13),
        SpaceV(10),
        ReviewCard(body: PriceReview()),
        SpaceV(20),
        Text("يرجي تأكيد  طلبك", style: TextStyles.bold13),
        SpaceV(10),
        ReviewCard(body: PaymentReview()),
        SpaceV(20),
        ReviewCard(body: AddressReview()),
      ],
    );
  }
}


