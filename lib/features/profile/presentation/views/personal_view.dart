import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/custom_app_bar.dart';
import 'package:rfaye3/core/widgets/custom_text_field.dart';
import 'package:rfaye3/core/widgets/space.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:rfaye3/features/profile/data/models/user_info_model.dart';
import 'package:rfaye3/features/profile/data/repo/profile_repo.dart';
import 'package:rfaye3/features/profile/presentation/view_model/personal_cubit/personal_cubit.dart';
import 'package:rfaye3/features/profile/presentation/view_model/personal_cubit/personal_state.dart';
import 'package:rfaye3/features/profile/presentation/views/user_address_card.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => PersonalCubit(
                getIt.get<ProfileRepo>(),
                getIt.get<CheckoutRepo>(),
              )..getUserInfo(),
        ),
        BlocProvider(
          create: (context) => AddressCubit(getIt.get<CheckoutRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: customAppBar(context, S.of(context).personal),
        body: const PersonalViewBody(),
      ),
    );
  }
}

class PersonalViewBody extends StatelessWidget {
  const PersonalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalCubit, PersonalState>(
      builder: (context, state) {
        if (state is PersonalSuccess) {
          return UserInfoColumn(userInfoModel: state.userInfoModel);
        } else if (state is PersonalLaoding) {
          return const UserInfoColumn();
        } else if (state is PersonalFailuer) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text("حدث خطأ في التحميل"));
        }
      },
    );
  }
}

class UserInfoColumn extends StatelessWidget {
  const UserInfoColumn({super.key, this.userInfoModel});
  final UserInfoModel? userInfoModel;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: userInfoModel == null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceV(10),
            Text(S.of(context).personalInfo, style: TextStyles.semiBold16),
            CustomTextField(
              hint: userInfoModel?.fullName ?? "adknlk adiovhiu",
              enabled: false,
            ),
            CustomTextField(
              hint: userInfoModel?.email ?? "ygybv@lnkns.cao",
              enabled: false,
            ),

            const SpaceV(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).address, style: TextStyles.semiBold16),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.addAddress);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit_location_outlined,
                        color: Colors.grey,
                      ),
                      const SpaceH(6),
                      Text(
                        S.of(context).edit,
                        style: TextStyles.medium15.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userInfoModel?.addresses?.length ?? 2,
                itemBuilder: (context, index) {
                  return UserAddressCard(
                    address:
                        userInfoModel?.addresses?[index] ??
                        Address(
                          id: "",
                          state: "advv",
                          city: "city",
                          street: "street",
                          apartment: "apartment",
                          phoneNumber: "phoneNumber",
                          notes: "notes",
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
