part of 'notification_cubit.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notifications;
  const NotificationSuccess({required this.notifications});
}

final class NotificationFail extends NotificationState {
  final String message;
  const NotificationFail({required this.message});
}
