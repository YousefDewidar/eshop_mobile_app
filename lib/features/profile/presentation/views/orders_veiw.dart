import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/features/profile/presentation/views/widgets/my_orders_card.dart';
import 'package:rfaye3/generated/l10n.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, S.of(context).myOrders),
      body: const OrderViewBody(),
    );
  }
}

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
      itemBuilder: (context, index) => const MyOrderCard(),
    );
  }
}
