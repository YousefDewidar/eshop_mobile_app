import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/data/models/order_payload_model.dart';
import 'package:rfaye3/features/checkout/data/models/shipping_type.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/payment_section.dart';

class PaymentReview extends StatelessWidget {
  const PaymentReview({super.key});

  @override
  Widget build(BuildContext context) {
    OrderPayload order = context.read<CheckoutCubit>().order;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("وسيلة الدفع", style: TextStyles.bold13),
        const SpaceV(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order.shippingType == ShippingType.Paymob
                  ? "دفع من خلال التطبيق"
                  : "دفع عند الاستلام",
              style: TextStyles.regular13.copyWith(color: AppColors.greyColor),
            ),
            if (order.shippingType == ShippingType.Paymob)
              Transform.scale(
                scale: .9,
                child: const PaymentTypeCard(img: Assets.imagesPaypal),
              ),
          ],
        ),
      ],
    );
  }
}
