import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/custom_text_field.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/generated/l10n.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _addressCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _streetCon = TextEditingController();

  @override
  void dispose() {
    _emailCon.dispose();
    _addressCon.dispose();
    _nameCon.dispose();
    _phoneCon.dispose();
    _streetCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SpaceV(10),
          CustomTextField(hint: S.current.fullName, controller: _nameCon),
          const SpaceV(8),
          CustomTextField(hint: S.current.email, controller: _emailCon),
          const SpaceV(8),
          CustomTextField(hint: S.current.phone, controller: _phoneCon),
          const SpaceV(8),
          CustomTextField(hint: S.current.address, controller: _addressCon),
          const SpaceV(8),
          CustomTextField(hint: S.current.address2, controller: _streetCon),
          const SpaceV(8),
          Row(
            children: [
              Switch(
                value: true,
                onChanged: (c) {},
                activeColor: AppColors.primaryColor,
              ),
              const SpaceH(5),
              Text(
                'حفظ العنوان',
                style: TextStyles.semiBold13
                    .copyWith(color: const Color(0xff949D9E)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
