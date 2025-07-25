import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';

class SwipleButton extends StatefulWidget {
  const SwipleButton({super.key});

  @override
  State<SwipleButton> createState() => _SwipleButtonState();
}

class _SwipleButtonState extends State<SwipleButton> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return SwipeButton(
      thumbPadding: const EdgeInsets.all(3),
      thumb: const Icon(Icons.chevron_right, color: Colors.grey),
      elevationThumb: 2,
      elevationTrack: 2,
      activeThumbColor: Colors.white,
      activeTrackColor: AppColors.primaryColor,
      height: 60,

      enabled: enabled,

      child: const Text(
        'تأكيد الطلب',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onSwipe: () async {
        enabled = false;
        setState(() {});
        await context.read<CheckoutCubit>().createOrder();
        enabled = true;
        setState(() {});
      },
    );
  }
}
