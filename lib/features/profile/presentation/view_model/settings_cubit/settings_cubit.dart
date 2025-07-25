import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/profile/presentation/view_model/settings_cubit/settings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  String langCode = 'ar';
  bool isDark = false;

  void init() {
    // get from shared preferences
    langCode = getIt.get<SharedPreferences>().getString('langCode') ?? 'ar';
    isDark = getIt.get<SharedPreferences>().getBool('isDark') ?? false;
    emit(SettingsInitial());
  }

  void changeLanguage({required String langCode}) {
    this.langCode = langCode;
    getIt.get<SharedPreferences>().setString('langCode', langCode);
    emit(SettingsChanged());
  }

  void changeTheme({required bool isDark}) {
    this.isDark = isDark;
    getIt.get<SharedPreferences>().setBool('isDark', isDark);
    emit(SettingsChanged());
  }
}
