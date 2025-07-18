import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('${bloc.runtimeType} closed');
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(
      'current state is ${change.currentState} and the next state is ${change.nextState}',
    );

    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
}
