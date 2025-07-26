
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_state.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/views/add_address_view.dart';
import 'package:rfaye3/features/checkout/presentation/views/widgets/address_card.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddressSectionView extends StatefulWidget {
  const AddressSectionView({super.key});

  @override
  State<AddressSectionView> createState() => _AddressSectionViewState();
}

class _AddressSectionViewState extends State<AddressSectionView> {
  int selectedIndex = -1;
  Address? newAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () async {
            final addressCubit = context.read<AddressCubit>();
            newAddress = await Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BlocProvider.value(
                      value: addressCubit,
                      child: const AddAddressView(),
                    ),
              ),
            );

            if (newAddress != null && context.mounted) {
              context.read<AddressCubit>().getAllAddress();
              context.read<CheckoutCubit>().order = context
                  .read<CheckoutCubit>()
                  .order
                  .copyWith(address: newAddress);
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Text(
              S.of(context).addAddress,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        const SpaceV(10),

        Expanded(
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is AddressLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return AddressCard(
                        index: index,
                        isSelected: false,
                        address: dummmyAddresses[0],
                      );
                    },
                  ),
                );
              }
              if (state is AddressSuccess) {
                return ListView.builder(
                  itemCount: state.addresses.length,
                  itemBuilder: (context, index) {
                    final isSelected =
                        ((index == selectedIndex) ||
                            (newAddress?.id == state.addresses[index].id) ||
                            (context.read<CheckoutCubit>().order.address?.id ==
                                state.addresses[index].id));

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          context.read<CheckoutCubit>().order = context
                              .read<CheckoutCubit>()
                              .order
                              .copyWith(address: state.addresses[index]);
                        });
                      },
                      child: AddressCard(
                        index: index,
                        isSelected: isSelected,
                        address: state.addresses[index],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    S.of(context).addFirstAddress,
                    style: TextStyles.regular16,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
