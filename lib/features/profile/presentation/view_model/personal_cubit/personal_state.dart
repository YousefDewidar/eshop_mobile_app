import 'package:rfaye3/features/profile/data/models/user_info_model.dart';

abstract class PersonalState {}

final class PersonalInitial extends PersonalState {}

final class PersonalLaoding extends PersonalState {}

final class PersonalSuccess extends PersonalState {
  final UserInfoModel userInfoModel;
  PersonalSuccess(this.userInfoModel);
}

final class PersonalFailuer extends PersonalState {
  final String errMessage;
  PersonalFailuer(this.errMessage);
}
