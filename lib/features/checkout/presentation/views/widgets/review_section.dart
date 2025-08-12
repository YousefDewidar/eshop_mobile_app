import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/custom_text_field.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_state.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/address_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/payment_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/price_review.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/review_card.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CouponCard(),
          SpaceV(12),

          Text("ملخص الطلب :", style: TextStyles.bold13),
          SpaceV(12),

          ReviewCard(body: PriceReview()),
          SpaceV(12),
          ReviewCard(body: PaymentReview()),
          SpaceV(12),

          ReviewCard(body: AddressReview()),

          // SpaceV(5),
        ],
      ),
    );
  }
}

class CouponCard extends StatefulWidget {
  const CouponCard({super.key});

  @override
  State<CouponCard> createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  late final TextEditingController couponCon;

  bool isUsedSuccess = false;

  @override
  void initState() {
    super.initState();
    couponCon = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    couponCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is UsedCouponSuccess) {
          isUsedSuccess = true;
          setState(() {});
        } else if (state is UsedCouponFail) {
          showNotification(context, state.errMessage, NotiType.error);
        }
      },
      builder: (context, state) {
        return CustomTextField(
          hint: 'ادخل كود الخصم',
          enabled: state is! UsedCouponSuccess,
          controller: couponCon,
          suffIcon:
              state is UsedCouponSuccess
                  ? const Icon(
                    Icons.done_outline_rounded,
                    color: AppColors.secondaryColor,
                  )
                  : TextButton(
                    onPressed: () {
                      if (couponCon.text.isNotEmpty) {
                        context.read<CheckoutCubit>().useCoupon(
                          couponCode: couponCon.text,
                        );
                      } else {
                        showNotification(
                          context,
                          "يرجي إدخال الكوبون",
                          NotiType.warning,
                        );
                      }
                    },
                    child: const Text("تفعيل"),
                  ),
        );
      },
    );
  }
}
