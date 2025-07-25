import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/data/models/shipping_type.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/ship_type.dart';
import 'package:rfaye3/generated/l10n.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
    selected =
        context.read<CheckoutCubit>().order.shippingType ==
                ShippingType.CashOnDelivery
            ? 1
            : 0;
  }

  @override
  Widget build(BuildContext context) {
    CheckoutCubit checkoutCubit = context.read<CheckoutCubit>();
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            selected = 0;
            checkoutCubit.order = checkoutCubit.order.copyWith(
              shippingType: ShippingType.Paymob,
              shipPrice: 0,
            );
            setState(() {});
          },
          child: ShipTypeCard(
            price: S.current.free,
            title: S.current.payOnline,
            title2: S.current.payOnline2,
            sel: selected == 0,
          ),
        ),
        const SpaceV(10),
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            selected = 1;
            checkoutCubit.order = checkoutCubit.order.copyWith(
              shippingType: ShippingType.CashOnDelivery,
              shipPrice: 30,
            );
            setState(() {});
          },
          child: ShipTypeCard(
            price: "30 ${S.current.egp}",
            title: S.current.payCash,
            title2: S.current.payCash2,
            sel: selected == 1,
          ),
        ),
      ],
    );
  }
}
