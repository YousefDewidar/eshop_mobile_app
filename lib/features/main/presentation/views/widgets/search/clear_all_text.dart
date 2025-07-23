
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_text_styles.dart';
import 'package:rfaye3/core/utils/constant.dart';
import 'package:rfaye3/features/main/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:rfaye3/features/main/presentation/view_model/search_cubit/search_state.dart';
import 'package:rfaye3/generated/l10n.dart';

class ClearAllText extends StatelessWidget {
  const ClearAllText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SliverVisibility(
          visible: (state is SearchInitial || state is SearchFailure),
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kHoripadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).lastSearch,
                    style: TextStyles.semiBold13,
                  ),
                  InkWell(
                    onTap: () async {
                      await context.read<SearchCubit>().clearSearchHistory();
                    },
                    child: Text(
                      S.of(context).clearAll,
                      style: TextStyles.regular13
                          .copyWith(color: AppColors.greyColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
