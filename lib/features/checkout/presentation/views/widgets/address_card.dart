import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_state.dart';
import 'package:rfaye3/generated/l10n.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.isSelected,
    required this.address,
    required this.index,
    this.onEdit,
    this.onDelete,
  });

  final bool isSelected;
  final Address address;
  final int index;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is AddressFailuer) {
          showNotification(context, state.errMessage, NotiType.error);
        }
      },
      child: Dismissible(
        key: Key(address.id),
        background: slideRightBackground(context),
        secondaryBackground: slideLeftBackground(context),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            onEdit?.call();
            return false; // ميتمسحش من الليست
          } else if (direction == DismissDirection.endToStart) {
            final confirm = await showDialog<bool>(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: const Text("تأكيد الحذف"),
                    content: const Text("هل أنت متأكد من حذف هذا العنوان؟"),
                    actions: [
                      TextButton(
                        child: const Text("إلغاء"),
                        onPressed: () => Navigator.pop(context, false),
                      ),
                      TextButton(
                        child: const Text("حذف"),
                        onPressed: () {
                          Navigator.pop(context, true);
                          context.read<AddressCubit>().removeAddress(
                            address.id,
                          );
                        },
                      ),
                    ],
                  ),
            );
            if (confirm == true) {
              onDelete?.call();
              return true;
            }
            return false;
          }
          return false;
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                (isSelected && isDark)
                    ? Theme.of(context).colorScheme.surface.withGreen(30)
                    : (isSelected && !isDark)
                    ? AppColors.lightPrimaryColor.withAlpha(30)
                    : Theme.of(context).colorScheme.surface,
            border: Border.all(
              color:
                  isSelected
                      ? AppColors.lightPrimaryColor
                      : Colors.grey.shade400,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${S.of(context).address} ${index + 1}',
                    style: TextStyles.semiBold16,
                  ),
                ],
              ),

              const Divider(color: Color.fromARGB(95, 158, 158, 158)),
              const SizedBox(height: 6),

              Text(address.fullAddress),
              if (address.notes.isNotEmpty) Text(address.notes),

              const SizedBox(height: 6),
              Row(
                children: [
                  Text(address.phoneNumber),
                  const SizedBox(width: 8),
                  if (address.phoneNumber.isNotEmpty)
                    const Text(
                      'تم التحقق',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // الخلفية عند السحب لليمين (تعديل)
  Widget slideRightBackground(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.blueAccent,
      child: const Row(
        children: [
          Icon(Icons.edit, color: Colors.white),
          SizedBox(width: 8),
          Text(
            "تعديل",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // الخلفية عند السحب لليسار (حذف)
  Widget slideLeftBackground(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.redAccent,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: Colors.white),
          SizedBox(width: 8),
          Text(
            "حذف",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
