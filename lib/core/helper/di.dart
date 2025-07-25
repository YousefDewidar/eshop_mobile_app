import 'package:dio/dio.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo_impl.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:rfaye3/features/main/data/repo/home_repo_impl.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:rfaye3/features/profile/data/repo/profile_repo.dart';
import 'package:rfaye3/features/profile/data/repo/profile_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

var getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CartRepo>(CartRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CheckoutRepo>(CheckoutRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl(getIt.get<ApiService>()));
  final sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.clear();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
}
