import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rfaye3/features/main/data/models/notification_model.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._homeRepo) : super(NotificationInitial());
  final HomeRepo _homeRepo;

  void getAllNotification() async {
    emit(NotificationLoading());
    final data = await _homeRepo.getAllNotifications();

    data.fold(
      (failuer) {
        emit(NotificationFail(message: failuer.message));
      },
      (notifications) {
        emit(NotificationSuccess(notifications: notifications));
      },
    );
  }

  Future<void> markAsRead({String? notiId, bool markAll = false}) async {
    final res = await _homeRepo.markAsReadNotification(
      notiId: notiId,
      markAll: markAll,
    );

    if (markAll && res.isRight()) {
      getAllNotification();
    }
  }
}
