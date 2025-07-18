import 'package:rfaye3/core/supabase/database_services.dart';
import 'package:rfaye3/core/supabase/supabase_auth_services.dart';
import 'package:rfaye3/features/auth/data/repo/supabase_repo_impl.dart';
import 'package:rfaye3/features/auth/domain/repo/auth_repo.dart';
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
}
