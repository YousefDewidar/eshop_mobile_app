
import 'package:rfaye3/features/main/data/repo/home_repo_impl.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var getIt = GetIt.instance;

Future<void> setupLocator() async {

  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
  final sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.clear();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
}
