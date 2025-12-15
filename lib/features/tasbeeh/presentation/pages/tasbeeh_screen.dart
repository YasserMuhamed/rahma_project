import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/tasbeeh/tasbeeh_cubit.dart';
import 'package:rahma_project/features/tasbeeh/presentation/widgets/tasbeeh_card.dart';
import 'package:rahma_project/features/tasbeeh/presentation/widgets/tasbeeh_form.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () => refreshTasbeeh(context),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                flexibleSpace: FlexibleSpaceBar(title: Text(context.t.tasabeeh)),
                actions: [IconButton(onPressed: () async => await onAdd(context), icon: const Icon(Icons.add_circle_outline))],
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                sliver: BlocBuilder<TasbeehCubit, TasbeehState>(
                  builder: (context, state) {
                    if (state is TasbeehLoading) {
                      return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                    }
                    if (state is TasbeehFailure) return SliverToBoxAdapter(child: Center(child: Text(state.error)));
                    if (state is TasbeehLoaded) {
                      return SliverList.builder(
                        itemCount: state.tasbeehList.length,
                        itemBuilder: (context, index) => TasbeehCard(item: state.tasbeehList.reversed.toList()[index]),
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

Future<void> onAdd(BuildContext context) async {
  final shouldRefresh = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (modalContext) => Padding(padding: MediaQuery.of(modalContext).viewInsets, child: const TasbeehForm()),
  );

  if (shouldRefresh == true && context.mounted) {
    await refreshTasbeeh(context);
  }
}

Future<void> refreshTasbeeh(BuildContext context) async {
  await context.read<TasbeehCubit>().getTasbeeh();
}
