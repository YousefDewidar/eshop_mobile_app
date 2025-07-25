// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/profile/data/models/user_info_model.dart';
import 'package:rfaye3/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  ApiService apiService;
  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, UserInfoModel>> getUserInfo() async {
    try {
      final res =await apiService.get("/api/auth/me");
      return Right(UserInfoModel.fromJson(res.data));
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }
}
