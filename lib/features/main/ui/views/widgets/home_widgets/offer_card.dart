import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/generated/l10n.dart';

class OfferCard extends StatelessWidget {
  final Color bgColor;
  const OfferCard({super.key, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Image.asset(
              Assets.imagesWatermelonTest,
              width: 180,
              height: 150,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ClipPath(
              clipper: CustomCurveClipper(),
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'عروض العيد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'خصم 25%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 32,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(0),
                            fixedSize: const Size(113, 32),
                          ),
                          onPressed: () {},
                          child: Text(
                            S.of(context).shopNow,
                            style: TextStyles.bold13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(20, 0);
    path.quadraticBezierTo(0, size.height / 2, 20, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
