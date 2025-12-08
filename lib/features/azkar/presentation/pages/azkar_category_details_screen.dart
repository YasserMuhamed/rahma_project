import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/config/theming/app_theme.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';
import 'package:rahma_project/features/azkar/presentation/cubit/azkar_cubit.dart';

class AzkarCategoryDetailsScreen extends StatelessWidget {
  const AzkarCategoryDetailsScreen({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AzkarCubit>()..getAzkarByCategory(category),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(flexibleSpace: FlexibleSpaceBar(title: Text(category))),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                sliver: BlocBuilder<AzkarCubit, AzkarState>(
                  buildWhen: (previous, current) {
                    return current is AzkarLoading || current is AzkarFailure || current is AzkarLoaded;
                  },
                  builder: (context, state) {
                    if (state is AzkarLoading) {
                      return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                    }
                    if (state is AzkarFailure) return SliverToBoxAdapter(child: Center(child: Text(state.error)));
                    if (state is AzkarLoaded) {
                      return SliverList.builder(
                        itemCount: state.azkarList.length,
                        itemBuilder: (context, index) => AzkarCard(item: state.azkarList[index]),
                      );
                    }
                    return SizedBox.shrink();
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

class AzkarCard extends StatelessWidget {
  const AzkarCard({super.key, required this.item});
  final AzkarEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).primaryColor,
        gradient: LinearGradient(
          colors: [AppColors.vibrantEmerald, AppColors.vibrantEmerald.withValues(alpha: .5)],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
        boxShadow: [BoxShadow(color: AppColors.vibrantEmerald.withAlpha(25), blurRadius: 10, offset: const Offset(0, 0))],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SelectableText(
            item.content,
            textAlign: TextAlign.start,
            style: AppTextStyles.w600_16().copyWith(color: Colors.white),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              item.description == ''
                  ? const SizedBox.shrink()
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SelectableText(
                          item.description,
                          textAlign: TextAlign.start,
                          style: AppTextStyles.w600_16().copyWith(color: DarkEarthyTheme.lightText.withValues(alpha: .85)),
                        ),
                      ),
                    ),
              if (item.count != '')
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    context.t.repeat(int.tryParse(item.count)?.toString() ?? item.count),

                    style: AppTextStyles.w600_16().copyWith(color: DarkEarthyTheme.lightText.withValues(alpha: .85)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
