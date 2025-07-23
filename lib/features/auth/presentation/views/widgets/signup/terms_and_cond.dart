import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class TermsAndCond extends StatefulWidget {
  final ValueChanged<bool> onChange;
  const TermsAndCond({
    super.key,
    required this.onChange,
  });

  @override
  State<TermsAndCond> createState() => _TermsAndCondState();
}

class _TermsAndCondState extends State<TermsAndCond> {
  bool isCkecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            isCkecked = !isCkecked;
            widget.onChange(isCkecked);
            // context.read<SignUpCubit>().rebuidButton();
            setState(() {});
          },
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isCkecked ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffDDDFDF)),
            ),
            child:
                const Icon(Icons.check_rounded, color: Colors.white, size: 16),
          ),
        ),
        const SpaceH(16),
        const Expanded(child: TermsText()),
      ],
    );
  }
}

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: S.of(context).termCon1,
        style: TextStyles.semiBold13.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      const TextSpan(text: ' '),
      TextSpan(
        text: S.of(context).termCon2,
        style: TextStyles.semiBold13.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    ]));
  }
}
