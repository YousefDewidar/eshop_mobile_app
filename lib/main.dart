import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/helper/simple_bloc_observer.dart';
import 'package:rfaye3/core/routes/generate_routes.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/supabase/keys.dart';
import 'package:rfaye3/core/utils/app_themes.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseAnonKey);
  Bloc.observer = SimpleBlocObserver();
  await setupLocator();
  // runApp(DevicePreview(builder: (context) => const Rfaye3App()));
  runApp(const Rfaye3App());
}

class Rfaye3App extends StatelessWidget {
  const Rfaye3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppThemes.getLightData(),
      darkTheme: AppThemes.getDarkData(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.splash,
    );
  }
}
