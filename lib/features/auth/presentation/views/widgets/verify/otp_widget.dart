import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required List<TextEditingController> otpControllers,
  }) : _otpControllers = otpControllers;

  final List<TextEditingController> _otpControllers;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width - 32 - 45) / 6,
            child: TextFormField(
              controller: _otpControllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(fontSize: 23),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF9FAFA),
                errorStyle: const TextStyle(height: .05),
                border: customBorder(),
                enabledBorder: customBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    width: 1.3,
                    color: AppColors.secondaryColor,
                  ),
                ),
                counterText: '', // Remove the character counter
              ),
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  FocusScope.of(context).nextFocus();
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
            ),
          );
        }),
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(width: 1.3, color: Color(0xffE6E9EA)),
    );
  }
}
