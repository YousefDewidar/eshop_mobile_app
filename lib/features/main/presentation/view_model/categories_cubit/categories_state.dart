import 'package:rfaye3/features/main/data/models/category_model.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;

  CategoriesSuccess({required this.categories});
}

class CategoriesFailure extends CategoriesState {
  final String message;

  CategoriesFailure({required this.message});
}
