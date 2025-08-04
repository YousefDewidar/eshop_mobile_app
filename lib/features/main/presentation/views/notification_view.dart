import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/notifications_cubit/notification_cubit.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/notifications/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              NotificationCubit(getIt.get<HomeRepo>())..getAllNotification(),
      child: const Scaffold(body: SafeArea(child: NotificationViewBody())),
    );
  }
}
