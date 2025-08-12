import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';



class PaymentTypeCard extends StatelessWidget {
  final String img;
  const PaymentTypeCard({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(img, width: 60);
  }
}
