import 'package:flutter/material.dart';

class SpaceV extends StatelessWidget {
  const SpaceV(
    this.height, {
    super.key,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SpaceH extends StatelessWidget {
  const SpaceH(
    this.width, {
    super.key,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
