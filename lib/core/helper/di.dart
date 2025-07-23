import 'package:dio/dio.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/supabase/database_services.dart';
import 'package:rfaye3/core/supabase/supabase_auth_services.dart';
import 'package:rfaye3/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rfaye3/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:rfaye3/features/auth/domain/repositories/auth_repository.dart';
import 'package:rfaye3/features/auth/domain/usecases/login_usecase.dart';
import 'package:rfaye3/features/auth/domain/usecases/signup_usecase.dart';
import 'package:rfaye3/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:rfaye3/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:rfaye3/features/authentication/data/repo/supabase_repo_impl.dart';
import 'package:rfaye3/features/authentication/domain/repo/auth_repo.dart';
import 'package:rfaye3/features/main/data/repo/home_repo_impl.dart';
import 'package:rfaye3/features/main/domain/repo/home_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<DatabaseServices>(DatabaseServices());

  getIt.registerSingleton<AuthRepo>(
    SupabaseRepoImpl(SupabaseAuthServices(), getIt.get<DatabaseServices>()),
  );

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(getIt.get<DatabaseServices>()),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.clear();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiService());

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(remoteDataSource: getIt.get<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));

  getIt.registerFactory(() => SignUpCubit(getIt.get<SignUpUseCase>()));
  getIt.registerFactory(() => LoginCubit(getIt.get<LoginUseCase>()));
}
