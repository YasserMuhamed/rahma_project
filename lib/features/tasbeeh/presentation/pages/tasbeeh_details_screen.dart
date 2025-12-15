import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/core/di/dependency_injection.dart';
import 'package:rahma_project/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:rahma_project/features/azkar/presentation/widgets/azkar_bloc_builder.dart';

class TasbeehDetailsScreen extends StatelessWidget {
  const TasbeehDetailsScreen({super.key, required this.category});
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
              AzkarBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
