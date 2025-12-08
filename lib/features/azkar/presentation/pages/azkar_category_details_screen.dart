import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        itemBuilder: (context, index) => AzkarCard(title: state.azkarList[index].content),
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
  const AzkarCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).primaryColor),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: AppTextStyles.w600_16().copyWith(color: Colors.white),
      ),
    );
  }
}
