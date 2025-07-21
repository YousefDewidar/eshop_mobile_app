import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/domain/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/manager/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  final HomeRepo homeRepo;

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    final data = await homeRepo.getAllCategories();
    data.fold(
      (failuer) {
        emit(CategoriesFailure(message: failuer.message));
      },
      (categories) {
        emit(CategoriesSuccess(categories: categories));
      },
    );
  }
}
