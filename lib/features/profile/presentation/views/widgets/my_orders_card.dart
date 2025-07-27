import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/profile/data/models/order_model.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class MyOrderCard extends StatefulWidget {
  final OrderModel order;
  const MyOrderCard({super.key, required this.order});

  @override
  State<MyOrderCard> createState() => _MyOrderCardState();
}

class _MyOrderCardState extends State<MyOrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            children: [
              // UI before expanded
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesOrder),
                  const SpaceH(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${S.of(context).orderNumber}: ${widget.order.orderCode}",
                              style: TextStyles.bold16,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              color: Colors.grey,
                              iconSize: 30,
                              icon:
                                  isExpanded
                                      ? const Icon(
                                        Icons.keyboard_arrow_up_rounded,
                                      )
                                      : const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                      ),
                            ),
                          ],
                        ),
                        Text(
                          "${S.of(context).orderDate}: ${widget.order.createdAt.toString().split(' ').first}",
                          style: TextStyles.regular13.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SpaceV(5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.order.totalPrice} ${S.of(context).egp}",
                              style: TextStyles.bold16,
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    widget.order.status == 'Pending'
                                        ? AppColors.lightSecondaryColor
                                            .withValues(alpha: 0.3)
                                        : AppColors.lightPrimaryColor
                                            .withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(widget.order.status),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // UI after expanded with animation
              AnimatedSize(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child:
                    isExpanded
                        ? Column(
                          children: [
                            const SpaceV(10),
                            const Divider(),
                            const SpaceV(5),
                            ExpandedInfoCard(
                              title: "طريقة الدفع",
                              date: widget.order.paymentMethod,
                            ),
                            ExpandedInfoCard(
                              title: "تم الطلب وجاري الشحن",
                              date:
                                  widget.order.createdAt
                                      .toString()
                                      .split(' ')
                                      .first,
                            ),
                            ExpandedInfoCard(
                              title: "تم الشحن وجاري التوصيل",
                              date:
                                  widget.order.updatedAt
                                      .toString()
                                      .split(' ')
                                      .first,
                            ),
                            const ExpandedInfoCard(
                              title: "تم التسليم",
                              date: "قيد الانتظار",
                              done: false,
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedInfoCard extends StatelessWidget {
  final String title;
  final String date;
  final bool done;
  const ExpandedInfoCard({
    super.key,
    required this.title,
    required this.date,
    this.done = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.semiBold16.copyWith(
              color:
                  done
                      ? Theme.of(context).textTheme.bodyLarge!.color
                      : Colors.grey,
            ),
          ),
          Text(
            date,
            style: TextStyles.regular13.copyWith(
              color:
                  done
                      ? Theme.of(context).textTheme.bodyLarge!.color
                      : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
