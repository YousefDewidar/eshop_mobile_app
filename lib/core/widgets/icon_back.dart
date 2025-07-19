import 'package:flutter/material.dart';

class IconsBack extends StatelessWidget {
  const IconsBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xffF1F1F5)),
        ),
        child: Icon(
          size: 16,
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
    );
  }
}
