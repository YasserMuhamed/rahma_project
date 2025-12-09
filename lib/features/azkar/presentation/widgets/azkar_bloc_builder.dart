import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:rahma_project/features/azkar/presentation/widgets/azkar_card.dart';

class AzkarBlocBuilder extends StatelessWidget {
  const AzkarBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
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
    );
  }
}
