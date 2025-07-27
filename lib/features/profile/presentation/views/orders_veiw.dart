import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/features/profile/data/models/order_model.dart';
import 'package:rfaye3/features/profile/data/repo/profile_repo.dart';
import 'package:rfaye3/features/profile/presentation/view_model/orders_cubit/orders_cubit.dart';
import 'package:rfaye3/features/profile/presentation/view_model/orders_cubit/orders_state.dart';
import 'package:rfaye3/features/profile/presentation/views/widgets/my_orders_card.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => OrdersCubit(getIt.get<ProfileRepo>())..getAllOrders(),
      child: Scaffold(
        appBar: customAppBar(context, S.of(context).myOrders),
        body: const OrderViewBody(),
      ),
    );
  }
}

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersSuccess) {
          return ListView.builder(
            itemCount: state.ordersList.length,
            padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
            itemBuilder:
                (context, index) => MyOrderCard(order: state.ordersList[index]),
          );
        } else if (state is OrdersLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
              itemBuilder:
                  (context, index) =>
                      MyOrderCard(order: OrderModel.getFakeOrder()),
            ),
          );
        } else if (state is OrdersFailuer) {
          return Center(child: Text(state.errMessage));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
