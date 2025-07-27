import 'package:rfaye3/features/profile/data/models/order_model.dart';

abstract class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final List<OrderModel> ordersList;
  OrdersSuccess(this.ordersList);
}

final class OrdersFailuer extends OrdersState {
  final String errMessage;
  OrdersFailuer(this.errMessage);
}
