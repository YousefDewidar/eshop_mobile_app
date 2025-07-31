
import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class AfterReview extends StatefulWidget {
  const AfterReview({super.key});

  @override
  State<AfterReview> createState() => _AfterReviewState();
}

class _AfterReviewState extends State<AfterReview> {
  bool _showData = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showData = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showData
        ? Column(
          spacing: 24,
          children: [
            SvgPicture.asset(Assets.imagesDone, height: 150),
            Text(
              S.of(context).addRate2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.greyColor),
            ),
            const SpaceV(0),
          ],
        )
        : const SizedBox.shrink();
  }
}
