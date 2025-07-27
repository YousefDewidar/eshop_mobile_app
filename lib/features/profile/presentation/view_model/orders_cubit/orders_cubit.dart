import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/profile/data/repo/profile_repo.dart';
import 'package:rfaye3/features/profile/presentation/view_model/orders_cubit/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._profileRepo) : super(OrdersInitial());

  final ProfileRepo _profileRepo;

  Future<void> getAllOrders() async {
    emit(OrdersLoading());
    final res = await _profileRepo.getAllOrders();

    res.fold(
      (fail) {
        emit(OrdersFailuer(fail.message));
      },
      (ordersList) {
        emit(OrdersSuccess(ordersList));
      },
    );
  }
}
