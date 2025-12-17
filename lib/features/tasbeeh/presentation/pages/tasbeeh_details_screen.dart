import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/helpers/azkar_helpers.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/core/utils/app_snack_bar.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';
import 'package:rahma_project/features/tasbeeh/presentation/cubit/cubit/update_clicks_cubit.dart';

class TasbeehDetailsScreen extends StatelessWidget {
  const TasbeehDetailsScreen({super.key, required this.item});

  final TasbeehEntity item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(title: Text(item.category), centerTitle: true),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                  onPressed: () => context.read<UpdateClicksCubit>().resetClicks(id: item.id),
                  icon: const Icon(Icons.restart_alt_outlined),
                ),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  item.formattedContent,
                  style: AppTextStyles.w800_28().copyWith(height: 1.5, fontFamily: "UthmanicHafs"),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  item.description,
                  style: AppTextStyles.w500_16().copyWith(color: AppColors.lightText.withValues(alpha: .6)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: Divider(height: 32, thickness: 1, color: AppColors.forestGreen, indent: 25, endIndent: 25)),
          SliverToBoxAdapter(
            child: BlocConsumer<UpdateClicksCubit, UpdateClicksState>(
              listener: (context, state) {
                if (state is UpdateClicksFailure) {
                  AppSnackbar.show(context: context, message: state.error, type: SnackbarType.error);
                }
              },
              builder: (context, state) {
                return Center(
                  child: Text(
                    (state is UpdateClicksLoaded) ? state.item.clicks.toString() : item.clicks.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.w800_32(),
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: GestureDetector(
              onTap: () => context.read<UpdateClicksCubit>().updateClicks(id: item.id),
              child: Container(
                height: context.height * .3,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.forestGreen.withValues(alpha: .6), borderRadius: BorderRadius.circular(16)),
                child: const Center(child: Icon(Icons.touch_app, size: 48, color: Color.fromARGB(26, 176, 196, 222))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
