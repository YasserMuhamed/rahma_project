import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:rahma_project/features/azkar/presentation/widgets/azkar_categories_builder.dart';

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
              SliverAppBar(title: Text(context.t.azkar)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                sliver: SliverLayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = constraints.crossAxisExtent > 768 ? 2 : 1;
                    return AzkarCategoriesBlocBuilder(crossAxisCount: crossAxisCount);
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
