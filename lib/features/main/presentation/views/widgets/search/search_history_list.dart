
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/search_cubit/search_state.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/search/search_history_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/helper/di.dart';

class SearchHistortyList extends StatelessWidget {
  const SearchHistortyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final pref = getIt.get<SharedPreferences>();
        List<String> searchHistory = pref.getStringList('searchHistory') ?? [];
        return SliverVisibility(
          visible: (state is SearchInitial || state is SearchFailure),
          sliver: SliverList.builder(
            itemCount: searchHistory.length,
            itemBuilder: (context, index) {
              return SearchHistoryCard(
                searchHistory: searchHistory[index],
              );
            },
          ),
        );
      },
    );
  }
}
