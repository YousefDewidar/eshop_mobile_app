import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/profile/data/repo/profile_repo.dart';
import 'package:rfaye3/features/profile/presentation/view_model/personal_cubit/personal_state.dart';

class PersonalCubit extends Cubit<PersonalState> {
  PersonalCubit(this._profileRepo, this._checkoutRepo)
    : super(PersonalInitial());

  final ProfileRepo _profileRepo;
  final CheckoutRepo _checkoutRepo;

  void getUserInfo() async {
    emit(PersonalLaoding());

    final userInfoRes = await _profileRepo.getUserInfo();
    final addressRes = await _checkoutRepo.getAllAddress();

    userInfoRes.fold(
      (fail) {
        emit(PersonalFailuer(fail.message));
      },
      (userInfo) {
        addressRes.fold(
          (failAddress) {
            emit(PersonalFailuer(failAddress.message));
          },
          (address) {
            emit(PersonalSuccess(userInfo.copyWith(addresses: address)));
          },
        );
      },
    );
  }
}
