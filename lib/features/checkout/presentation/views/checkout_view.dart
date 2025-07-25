import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  final num orderPrice;
  const CheckoutView({super.key, required this.orderPrice});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  AddressCubit(getIt.get<CheckoutRepo>())..getAllAddress(),
        ),
        BlocProvider(
          create:
              (context) =>
                  CheckoutCubit(getIt.get<CheckoutRepo>())
                    ..setOrderPrice(orderPrice),
        ),
      ],

      child: const Scaffold(body: SafeArea(child: CheckoutViewBody())),
    );
  }
}
