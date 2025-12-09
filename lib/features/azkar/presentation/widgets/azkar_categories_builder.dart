import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rahma_project/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:rahma_project/features/azkar/presentation/widgets/azkar_category_card.dart';

class AzkarCategoriesBlocBuilder extends StatelessWidget {
  const AzkarCategoriesBlocBuilder({super.key, required this.crossAxisCount});

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      buildWhen: (previous, current) {
        return current is AzkarCategoriesLoading || current is AzkarCategoriesFailure || current is AzkarCategoriesLoaded;
      },
      builder: (context, state) {
        if (state is AzkarCategoriesLoading) {
          return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        }
        if (state is AzkarCategoriesFailure) return SliverToBoxAdapter(child: Center(child: Text(state.error)));
        if (state is AzkarCategoriesLoaded) {
          return SliverMasonryGrid.count(
            crossAxisCount: crossAxisCount,
            childCount: state.azkarCategories.length,
            itemBuilder: (context, index) => AzkarCategoryCard(title: state.azkarCategories[index]),
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
