import 'package:flutter/material.dart';
import 'package:rahma_project/config/theming/app_colors.dart';
import 'package:rahma_project/config/theming/app_text_styles.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/tasbeeh/domain/entities/tasbeeh_entity.dart';

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
                child: IconButton(onPressed: () async => {}, icon: const Icon(Icons.restart_alt_outlined)),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(item.content, style: AppTextStyles.w800_24().copyWith(height: 1.5), textAlign: TextAlign.center),
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
            child: Center(
              child: Text(item.clicks.toString(), textAlign: TextAlign.center, style: AppTextStyles.w800_32().copyWith(height: 1.5)),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: GestureDetector(
              onTap: () => context.pop(),
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
