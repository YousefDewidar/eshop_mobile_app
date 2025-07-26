import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/core/widgets/custom_button.dart';
import 'package:rfaye3/core/widgets/custom_text_field.dart';
import 'package:rfaye3/core/widgets/in_app_notification.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_state.dart';
import 'package:rfaye3/generated/l10n.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final TextEditingController _stateCon = TextEditingController();
  final TextEditingController _cityCon = TextEditingController();
  final TextEditingController _streetCon = TextEditingController();
  final TextEditingController _apartmentCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _notesCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _stateCon.dispose();
    _cityCon.dispose();
    _apartmentCon.dispose();
    _phoneCon.dispose();
    _streetCon.dispose();
    _notesCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(getIt.get<CheckoutRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, S.of(context).addAddress),
        body: Padding(
          padding: const EdgeInsets.all(kHoripadding),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SpaceV(10),

                  CustomTextField(hint: S.current.state, controller: _stateCon),

                  const SpaceV(8),

                  CustomTextField(hint: S.current.city, controller: _cityCon),

                  const SpaceV(8),

                  CustomTextField(
                    hint: S.current.street,
                    controller: _streetCon,
                  ),

                  const SpaceV(8),
                  CustomTextField(
                    hint: S.current.phoneNumber,
                    controller: _phoneCon,
                  ),

                  const SpaceV(8),

                  CustomTextField(
                    hint: S.current.apartment,
                    controller: _apartmentCon,
                  ),

                  const SpaceV(8),

                  CustomTextField(
                    hint: S.current.notes,
                    controller: _notesCon,
                    required: false,
                  ),

                  const SpaceV(50),

                  BlocConsumer<AddressCubit, AddressState>(
                    listener: (context, state) {
                      if (state is AddAddressSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          showNotification(
                            context,
                            "تم إضافة العنوان بنجاح",
                            NotiType.success,
                          );
                          Navigator.pop(context, state.newAddress);
                        });
                      } else if (state is AddressFailuer) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          showNotification(
                            context,
                            state.errMessage,
                            NotiType.error,
                          );
                        });
                      }
                    },

                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state is AddressLoading,
                        title: S.of(context).saveAddress,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AddressCubit>().addNewAddress(
                              Address(
                                id: "",
                                state: _stateCon.text,
                                city: _cityCon.text,
                                street: _streetCon.text,
                                apartment: _apartmentCon.text,
                                phoneNumber: _phoneCon.text,
                                notes: _notesCon.text,
                              ),
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
