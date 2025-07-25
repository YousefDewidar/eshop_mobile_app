import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_state.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/checkout_appbar.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/steps_row.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/swipe_button.dart';
import 'package:rfaye3/generated/l10n.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int curPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      curPage = pageController.page!.toInt();
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String getTextForButton() {
    if (curPage == 2) {
      return 'تأكيد الطلب';
    } else {
      return S.current.next;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CheckoutAppBar(title: getStepsTitle()[curPage]),
          const SpaceV(16),
          StepsRow(curPage: curPage, pageController: pageController),
          const SpaceV(24),
          CheckoutPageView(pageController: pageController),
          const SpaceV(24),
          BlocListener<CheckoutCubit, CheckoutState>(
            listener: (context, state) {
              if (state is CheckoutFail) {
                showNotification(
                  context,
                  'حدذ خطأ اثناء الدفع',
                  NotiType.error,
                );
              } else if (state is CheckoutSuccess) {
                Navigator.pop(context, true);
              }
            },
            child:
                curPage == 2
                    ? const SwipleButton()
                    : CustomButton(
                      title: getTextForButton(),
                      onPressed: () async {
                        if (context.read<CheckoutCubit>().order.address ==
                                null &&
                            curPage == 1) {
                          showNotification(
                            context,
                            "يرجي اختيار عنوان أولا",
                            NotiType.warning,
                          );
                          return;
                        }

                        await pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        // getCurPage();
                      },
                    ),
          ),
          MediaQuery.of(context).padding.bottom > 0
              ? const SpaceV(0)
              : const SpaceV(16),
        ],
      ),
    );
  }
}
