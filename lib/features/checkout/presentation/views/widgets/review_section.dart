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
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ملخص الطلب :", style: TextStyles.bold13),
          ReviewCard(body: PriceReview()),
          ReviewCard(body: PaymentReview()),
          ReviewCard(body: AddressReview()),
          CouponCard(),
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

  bool isVisible = false;
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
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("هل لديك كوبون خصم؟"),
                Switch(
                  value: isVisible,
                  onChanged: (value) {
                    isVisible = value;
                    setState(() {});
                  },
                  activeColor: AppColors.primaryColor,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[200],
                ),
              ],
            ),
            const SpaceV(5),
            Visibility(
              visible: isVisible,
              child: CustomTextField(
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
              ),
            ),
          ],
        );
      },
    );
  }
}
