import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/helper/di.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/core/widgets/search_text_field.dart';
import 'package:rfaye3/features/main/presentation/manager/search_cubit/search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prefs = getIt.get<SharedPreferences>();
    return SliverToBoxAdapter(

      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kHoripadding, vertical: 16),
        child: SearchTextField(
          onChanged: (value) {
            if (value.isEmpty || value.trim().isEmpty) {
              context.read<SearchCubit>().rebuildSearchHistory();
            }
          },
          onSubmitted: (value) {
            if (value.isEmpty || value.trim().isEmpty) return;
            context.read<SearchCubit>().searchProducts(query: value);
            setLastSearchToLocal(prefs, value);
          },
        ),
      ),
    );
  }

  void setLastSearchToLocal(SharedPreferences prefs, String value) {
    List<String> searchHistory = prefs.getStringList('searchHistory') ?? [];
    if (!searchHistory.contains(value)) {
      searchHistory.insert(0, value);
      if (searchHistory.length > 5) {
        searchHistory.removeLast();
      }
      prefs.setStringList('searchHistory', searchHistory);
    }
  }
}
