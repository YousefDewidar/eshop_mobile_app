import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/data/models/order_payload_model.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:svg_flutter/svg.dart';

class AddressReview extends StatelessWidget {
  const AddressReview({super.key});

  @override
  Widget build(BuildContext context) {
    OrderPayload order = context.read<CheckoutCubit>().order;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("عنوان التوصيل", style: TextStyles.bold13),

        const SpaceV(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesLocation),
            const SpaceH(8),
            Expanded(
              child: Text(
                order.address!.fullAddress,
                style: TextStyles.regular16.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
