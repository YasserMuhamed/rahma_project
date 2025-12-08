import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rahma_project/config/routing/app_routes.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/azkar/presentation/cubit/azkar_cubit.dart';

class AzkarCategoriesScreen extends StatelessWidget {
  const AzkarCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AzkarCubit>()..getAzkarCategories(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(flexibleSpace: FlexibleSpaceBar(title: Text(context.t.azkar))),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                sliver: SliverLayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = constraints.crossAxisExtent > 768 ? 2 : 1;

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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AzkarCategoryCard extends StatelessWidget {
  const AzkarCategoryCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(Routes.azkarDetailsScreen, extra: title),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).primaryColor),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(title, style: AppTextStyles.w600_16().copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
