import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/address_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/payment_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/price_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/review_card.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ملخص الطلب :", style: TextStyles.bold13),
        ReviewCard(body: PriceReview()),
        ReviewCard(body: PaymentReview()),
        ReviewCard(body: AddressReview()),
      ],
    );
  }
}
