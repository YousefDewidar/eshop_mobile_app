import 'package:rfaye3/features/main/domain/entities/category_entity.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> categories;

  CategoriesSuccess({required this.categories});
}

class CategoriesFailure extends CategoriesState {
  final String message;

  CategoriesFailure({required this.message});
}
