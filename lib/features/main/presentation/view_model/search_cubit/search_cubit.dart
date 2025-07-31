import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/search_cubit/search_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._homeRepo) : super(SearchInitial());

  final HomeRepo _homeRepo;
  String catName = '';

  Future<void> searchProducts({
    String query = '',
    String catName = '',
    String sortOrder = 'desc',
    num minPrice = 0,
    num maxPrice = 1000000,
  }) async {
    emit(SearchLoading());
    this.catName = catName;
    final data = await _homeRepo.searchProducts(
      query: query,
      catName: catName,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortOrder: sortOrder,
    );
    data.fold(
      (failuer) {
        emit(SearchFailure(message: failuer.message));
      },
      (products) {
        emit(SearchSuccess(products: products));
      },
    );
  }

  Future<void> clearSearchHistory({String? searchText}) async {
    final prefs = getIt.get<SharedPreferences>();
    if (searchText != null) {
      final List<String> searchHistory =
          prefs.getStringList('searchHistory') ?? [];
      searchHistory.remove(searchText);
      await prefs.setStringList('searchHistory', searchHistory);
    } else {
      await prefs.remove('searchHistory');
    }

    emit(SearchInitial());
  }

  void rebuildSearchHistory() {
    emit(SearchInitial());
  }
}
