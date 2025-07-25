import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/profile/data/models/user_info_model.dart';

abstract class ProfileRepo {
  Future<Either<Failuer, UserInfoModel>> getUserInfo();
}
