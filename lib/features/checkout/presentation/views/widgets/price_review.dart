import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/data/models/order_payload_model.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:rfaye3/generated/l10n.dart';

class PriceReview extends StatelessWidget {
  const PriceReview({super.key});

  @override
  Widget build(BuildContext context) {
    OrderPayload orderPayload = context.read<CheckoutCubit>().order;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "المجموع الفرعي :",
              style: TextStyles.regular13.copyWith(
                color: const Color(0xff4E5556),
              ),
            ),
            Text(
              "${orderPayload.orderPrice!.toStringAsFixed(2)} ${S.current.egp}",
              style: TextStyles.semiBold16,
            ),
          ],
        ),
        const SpaceV(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "التوصيل :",
              style: TextStyles.regular13.copyWith(
                color: const Color(0xff4E5556),
              ),
            ),
            Text(
              orderPayload.shipPrice == 0
                  ? "مجاني"
                  : "${orderPayload.shipPrice} ${S.current.egp}",
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xff4E5556),
              ),
            ),
          ],
        ),
        const Divider(indent: 30, endIndent: 30, color: Color(0xffCACECE)),
        const SpaceV(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("الكلي", style: TextStyles.bold16),
            Text(
              "${(orderPayload.shipPrice! + orderPayload.orderPrice!).toStringAsFixed(2)} ${S.current.egp}",
              style: TextStyles.bold16,
            ),
          ],
        ),
        const SpaceV(5),
      ],
    );
  }
}
