import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/ui/manager/search_cubit/search_cubit.dart';

class SearchHistoryCard extends StatelessWidget {
  const SearchHistoryCard({
    super.key,
    required this.searchHistory,
  });
  final String searchHistory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SearchCubit>().searchProducts(query: searchHistory);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: kHoripadding),
        minTileHeight: 0,
        title: Text(
          searchHistory,
          style: TextStyles.regular16,
        ),
        trailing: InkWell(
          onTap: () async {
            await context.read<SearchCubit>().clearSearchHistory(
                  searchText: searchHistory,
                );
          },
          child: const Icon(
            Icons.close_rounded,
          ),
        ),
        leading: const Icon(
          Icons.access_time_rounded,
          // size: 16,
          color: AppColors.greyColor,
        ),
      ),
    );
  }
}
