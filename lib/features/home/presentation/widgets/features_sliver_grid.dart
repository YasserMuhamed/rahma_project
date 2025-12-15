import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:rahma_project/config/routing/app_routes.dart';
import 'package:rahma_project/core/helpers/extensions.dart';
import 'package:rahma_project/features/home/presentation/widgets/feature_card.dart';

class FeaturesSliverGrid extends StatelessWidget {
  const FeaturesSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView(
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      children: [
        FeatureCard(title: context.t.azkar, icon: Icon(Icons.book), onTap: () => GoRouter.of(context).push(Routes.azkarCategoriesScreen)),
        FeatureCard(
          title: context.t.qibla,
          icon: Icon(Icons.navigation_outlined),
          onTap: () => GoRouter.of(context).push(Routes.quiblaScreen),
        ),
        // FeatureCard(title: context.t.prayer_times, icon: Icon(Icons.watch_later_outlined)),
        FeatureCard(
          title: context.t.tasabeeh,
          icon: Icon(Icons.checklist_rtl_rounded),
          onTap: () => GoRouter.of(context).push(Routes.tasabeehScreen),
        ),
        FeatureCard(title: context.t.quraan, icon: Icon(Icons.menu_book_rounded)),
      ],
    );
  }
}
