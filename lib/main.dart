import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/helper/simple_bloc_observer.dart';
import 'package:rfaye3/core/routes/generate_routes.dart';
import 'package:rfaye3/core/routes/routes.dart';
import 'package:rfaye3/core/utils/app_themes.dart';
import 'package:rfaye3/core/widgets/no_internet_view.dart';
import 'package:rfaye3/features/profile/presentation/view_model/settings_cubit/settings_cubit.dart';
import 'package:rfaye3/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await setupLocator();

  runApp(const Rfaye3App());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Rfaye3App extends StatefulWidget {
  const Rfaye3App({super.key});

  @override
  State<Rfaye3App> createState() => _Rfaye3AppState();
}

class _Rfaye3AppState extends State<Rfaye3App> {
  bool isScreenShown = false;

  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final hasConnection = results.any((e) => e != ConnectivityResult.none);

      if (!hasConnection && !isScreenShown) {
        isScreenShown = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(
            navigatorKey.currentContext!,
          ).push(MaterialPageRoute(builder: (_) => const NoInternetView()));
        });
      } else if (hasConnection && isScreenShown) {
        isScreenShown = false;
        Navigator.of(
          navigatorKey.currentContext!,
        ).popUntil((route) => route.isFirst);
      }
    });

    Connectivity().checkConnectivity().then((List<ConnectivityResult> results) {
      final hasConnection = results.any((e) => e != ConnectivityResult.none);
      if (!hasConnection && !isScreenShown) {
        isScreenShown = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(
            navigatorKey.currentContext!,
          ).push(MaterialPageRoute(builder: (_) => const NoInternetView()));
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..init(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            themeMode: ThemeMode.dark,
            // context.watch<SettingsCubit>().isDark
            //     ? ThemeMode.dark
            //     : ThemeMode.light,
            theme: AppThemes.getLightData(),
            darkTheme: AppThemes.getDarkData(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(context.watch<SettingsCubit>().langCode),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: Routes.splash,
          );
        },
      ),
    );
  }
}
