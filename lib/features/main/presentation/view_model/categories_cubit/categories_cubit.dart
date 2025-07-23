import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/categories_cubit/categories_state.dart';

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
