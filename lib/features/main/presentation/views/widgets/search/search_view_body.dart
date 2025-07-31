import 'package:flutter/material.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/home_products/app_bar_with_notification.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/search/clear_all_text.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/search/products_result_grid_view_bloc_consumer.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/search/search_field.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/search/search_history_list.dart';
import 'package:rfaye3/features/main/presentation/views/widgets/search/search_result_text.dart';
import 'package:rfaye3/generated/l10n.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        AppBarWithNotification(title: S.of(context).search),
        const SearchField(),
        const ClearAllText(),
        const SearchHistortyList(),
        const SearchResultText(),
        const ProductsResultGridViewBlocConsumer(),
      ],
    );
  }
}
